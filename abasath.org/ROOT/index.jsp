<html>

	<style>

	body
	{
		background-image: url(./images/background.jpg);

		color: white;

		background-color: #555555;
	}


	</style>

	<body>

	<pre>

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webcrawler.implementations.three.initialization;

import webcrawler.implementations.three.system.SystemReadout;
import webcrawler.registration.Registrar;

/**
 *
 * @author Max Rupplin
 */
public class Preinitializer extends webcrawler.intialization.Preinitializer implements Runnable
{
    public Registrar registrar = new Registrar();

    /**
     *
     */
    public Preinitializer()
    {
        this.registrar.register(SystemReadout.class);
    }

    /**
     *
     */
    public void preinitialize()
    {

    }

    /**
     *
     */
    public void run()
    {
        for(Class _class : registrar.classes)
        {
            Object object=null;

            Runnable runner=null;

            try
            {
                object = _class.newInstance();
            }
            catch(Exception e)
            {
                e.printStackTrace(); return;
            }

            if(object instanceof Runnable)
            {
                runner = (Runnable)object;
            }

            if(runner!=null)
            {
                runner.run();
            }
            else
            {
                System.out.println("No module object was found for class "+_class.getName());
            }
        }
    }
}



	</pre>

	</body>

</html>
