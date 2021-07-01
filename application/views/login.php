<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<?php echo base_url() ?>dist/css/style.min.css" rel="stylesheet">
	<title>Login </title>
</head>
<body>

<style >
	.container {
		width: 40% !important;
		border: 1px solid #e7e7e7;
		padding: 15px 10px;
		transform: translateY(35%);
	}
	     body {
        background-color: #F3EBF6;
        font-family: 'Ubuntu', sans-serif;
    }
    
    .main {
        background-color: #FFFFFF;
        width: 400px;
        height: 400px;
        margin: 7em auto;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
    }
    
    .sign {
        padding-top: 40px;
        color: #8C55AA;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
    .un {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
    form.form1 {
        padding-top: 40px;
    }
    
    .pass {
            width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
   
    .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    
    .submit {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #9C27B0, #E040FB);
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 35%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
    
    

    
   
</style>


	
	 <div class="main">
    <p class="sign" align="center">Sign in</p>

	<?php  

		if($this->session->has_userdata("msg")) {
			echo $this->session->userdata("msg");
			$this->session->unset_userdata("msg");
		}

	?>

	<?php echo form_open("init/login") ?>
	<div class="row clearfix">

		<div class="col-md-12">
			<label>Username</label>
			<input type="text" name="username" class="form-control input-sm" required="" autofocus="" >
		</div>
		<div class="col-md-12">
			<br>
			<label>Password</label>
			<input type="password" name="password" class="form-control input-sm" required="">
		</div>
		<div class="col-md-12">
			<br>
			<button class="submit" type="submit">Sign in</button>
		</div>
	</div>
	<?php echo form_close() ?>

	<br>
	<br>
	
</div>

</body>
</html>

<script src="<?php echo base_url() ?>assets/libs/jquery/dist/jquery.min.js"></script>

<script src="<?php echo base_url() ?>assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="<?php echo base_url() ?>assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<?php echo base_url() ?>dist/js/app-style-switcher.js"></script>

<script src="<?php echo base_url() ?>dist/js/waves.js"></script>

<script src="<?php echo base_url() ?>dist/js/sidebarmenu.js"></script>

<script src="<?php echo base_url() ?>dist/js/custom.js"></script>