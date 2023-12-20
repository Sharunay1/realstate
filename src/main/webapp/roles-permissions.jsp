<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="./AddRolePermissionSrv" method="post">
    <div id="addemployee" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add RolePermission</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">RoleID <span class="text-danger">*</span></label>
                                    <input name="roleid" required class="form-control" type="number">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">ModuleName</label>
                                    <input name="module name" required class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">FormName <span class="text-danger">*</span></label>
                                    <input name="formname" required class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">PermissionType <span class="text-danger">*</span></label>
                                    <input name="permissiontype" required class="form-control" type="number">
                                </div>
                            </div>
                           </div>
                          </div>
                        </div>
                         </div>
                        </div>
                      </form>  
                      
                      
       <form action="./EditRolePermissionServlet" method="post">
    <div id="addemployee" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add RolePermission</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                        <div class="row">
                        <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">RolePermissionID <span class="text-danger">*</span></label>
                                    <input name="rolepermissionId" required class="form-control" type="number">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">RoleID <span class="text-danger">*</span></label>
                                    <input name="roleid" required class="form-control" type="number">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">ModuleName</label>
                                    <input name="modulename" required class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">FormName <span class="text-danger">*</span></label>
                                    <input name="formname" required class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">PermissionType <span class="text-danger">*</span></label>
                                    <input name="permissiontype" required class="form-control" type="number">
                                </div>
                            </div>
                           </div>
                          </div>
                        </div>
                         </div>
                        </div>
                      </form>  
                     
            <form action="./DeleteRolePermissionSrv" method="post">
    <div id="addemployee" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Delete Roles</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Role ID<span class="text-danger">*</span></label>
                                    <input name="roleid" required class="form-control" type="text">
                                </div>
                            </div>
                            
                          </div>
                          
                           <div class="submit-section">
                            <button type="submit" name="delete_role" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                      </div>
                    </div>
               </div>
           </div>
         </form>
         </body>
</html>