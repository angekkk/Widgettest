<?php
    require('conn.php');
    $id = $_GET['id'];

    if (isset($_POST['submit'])) {
    	$id = $_POST['id'];
    	$nome = $_POST['nome'];
    	$versione = $_POST['versione'];
    	$descrizione = $_POST['descrizione'];
    	$mysqli->query("UPDATE `dataset` SET `id` = $id, `nome` = '$nome', `versione`='$versione', `descrizione`='$descrizione' WHERE `id`=$id");
    	header("location:index.php");
    }

    $members = $mysqli->query("SELECT * FROM `dataset` WHERE `id`=$id");
    $mem = mysqli_fetch_assoc($members);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dataset Details</title>

    <!-- Bootstrap Core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form method="post" action="editdata.php" role="form">
	<div class="modal-body">
		<div class="form-group">
			<label for="id">ID</label>
			<input type="text" class="form-control" id="id" name="id" value="<?php echo $mem['id'];?>" readonly="true"/>

		</div>
		<div class="form-group">
			<label for="nome">Nome</label>
			<input type="text" class="form-control" id="nome" name="nome" value="<?php echo $mem['nome'];?>" />
		</div>
		<div class="form-group">
			<label for="versione">Versione</label>
				<input type="text" class="form-control" id="versione" name="versione" value="<?php echo $mem['versione'];?>" />
		</div>
		<div class="form-group">
			<label for="descrizione">Descrizione</label>
			<input type="text" class="form-control" id="descrizione" name="descrizione" value="<?php echo $mem['descrizione'];?>" />

		</div>
		</div>
		<div class="modal-footer">
			<input type="submit" class="btn btn-primary" name="submit" value="Update" />&nbsp;
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</form>
</body>
</html>
