<?jsp
include("config.jsp");
$uid = $_GET['id'];

// view code//
$sql = "SELECT * FROM user where uid='$uid'";
$result = mysqli_query($con, $sql);
while($row = mysqli_fetch_array($result))
	{
	  $img=$row["uimage"];
	}
@unlink('user/'.$img);

//end view code
$msg="";
$sql = "DELETE FROM user WHERE uid = {$uid}";
$result = mysqli_query($con, $sql);
if($result == true)
{
	$msg="<p class='alert alert-success'>Agent Deleted</p>";
	header("Location:useragent.jsp?msg=$msg");
}
else
{
	$msg="<p class='alert alert-warning'>Agent not Deleted</p>";
		header("Location:useragent.jsp?msg=$msg");
}

mysqli_close($con);
?>
