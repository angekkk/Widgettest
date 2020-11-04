<?php
    require('conn.php');
    header('Content-Type: application/json');
    $result = $mysqli->query("SELECT * FROM `dataset`");
     while ($mem = mysqli_fetch_assoc($result)):

                                // encode array to json
                                $json = json_encode(array('Gundam'.'id' => $mem['id'],'nome' => $mem['nome'],'versione' => $mem['versione'],'descrizione' => $mem['descrizione'],'nodi' => $mem['nodi'],'thumb' => $mem['thumb']));

                                //write json to file
                                if (file_put_contents("".$mem['nome'].".json", $json)){
                                //ok

                                }
                             endwhile;
                             /* free result set */
                             $result->close();



?>