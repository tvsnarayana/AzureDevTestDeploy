<html>
  <head>
    <title>Hello World!</title>
  </head>
  <body>
    <h1>Hello from the PHP Web application</h1>
    <?php 
       $service_url = 'http://rest:8080/JerseyHelloWorld/rest/helloworld';
       $curl = curl_init($service_url);
       curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
       $curl_response = curl_exec($curl);
       if ($curl_response === false) {
         $info = curl_getinfo($curl);
         curl_close($curl);
         die('error occured during curl exec. Additioanl info: ' . var_export($info));
       }

       curl_close($curl);
    ?>
    <p>The Java REST API says: "<?php echo $curl_response ?>"</p>
  </body>
</html>
