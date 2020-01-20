package my;

import org.glassfish.grizzly.http.server.*;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) throws IOException, ClassNotFoundException, NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        HttpServer httpServer = HttpServer.createSimpleServer(System.getProperty("user.dir"), 9001);

        ServerConfiguration serverConfiguration = httpServer.getServerConfiguration();
        serverConfiguration.addHttpHandler(
                new HttpHandler() {
                    public void service(Request request, Response response) throws Exception {
                        final SimpleDateFormat format = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss zzz", Locale.US);
                        final String date = format.format(new Date(System.currentTimeMillis()));
                        response.setContentType("text/plain");
                        response.setContentLength(date.length());
                        response.getWriter().write(date);
                    }
                },
                "/time");
        try {
            String targetArg = getArgSafe(args, 0);
            String needWait = getArgSafe(args, 1);
            if (targetArg != null) {
                String[] targetArgArr = targetArg.split("/");
                String type = targetArgArr[0];
                if ("true".equals(type)) {
                    runTarget(targetArgArr[1], targetArgArr[2]);
                }
            }
            httpServer.start();
            if ("true".equals(needWait)) {
                System.in.read();
            }
        } catch (IOException e) {
            throw e;
        }
    }

    private static String getArgSafe(String[] args, int i) {
        try {
            return args[i];
        } catch (ArrayIndexOutOfBoundsException e) {

        }
        return null;
    }

    private static void runTarget(String clazz, String method) throws ClassNotFoundException, NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        Class<?> aClass1 = Class.forName(clazz);
        Method declaredMethod = aClass1.getDeclaredMethod(method, String[].class);
        declaredMethod.invoke(null, (Object) new String[]{});
    }
}
