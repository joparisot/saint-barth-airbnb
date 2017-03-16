$(document).ready(function(){
  $('.datepicker').datepicker({
    format: 'dd/mm/yyyy'
  });
  $('.datepicker').datepicker().on('changeDate',function(e) {
  $('.datepicker').datepicker('hide');
  });
})
