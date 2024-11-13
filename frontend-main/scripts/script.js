$(document).ready(function(){
    console.log("O documento está pronto!!")
    var prefix = 'picker__'

$('.datepicker').pickadate({
    labelMonthNext: 'Go to the next month',
    labelMonthPrev: 'Go to the previous month',
    labelMonthSelect: 'Pick a month from the dropdown',
    labelYearSelect:'Pick a year from the dropdown',
    selectMonths:true,
    selectYears:100,
    max: new Date(),

    // Today and clear
    today: 'Today',
    clear: 'Clear',
    close: 'Close',
  
    // Picker close behavior
    closeOnSelect: true,
    closeOnClear: true,
  
    // Update input value on select/clear
    updateInput: true,
  
    // The format to show on the `input` element
    format: 'dd mmmm, yyyy',
  
    // Classes
    klass: {
  
        table: prefix + 'table',
    
        header: prefix + 'header',
    
        navPrev: prefix + 'nav--prev',
        navNext: prefix + 'nav--next',
        navDisabled: prefix + 'nav--disabled',
    
        month: prefix + 'month',
        year: prefix + 'year',
    
        selectMonth: prefix + 'select--month',
        selectYear: prefix + 'select--year',
    
        weekdays: prefix + 'weekday',
    
        day: prefix + 'day',
        disabled: prefix + 'day--disabled',
        selected: prefix + 'day--selected',
        highlighted: prefix + 'day--highlighted',
        now: prefix + 'day--today',
        infocus: prefix + 'day--infocus',
        outfocus: prefix + 'day--outfocus',
    
        footer: prefix + 'footer',
    
        buttonClear: prefix + 'button--clear',
        buttonToday: prefix + 'button--today',
        buttonClose: prefix + 'button--close'
      }
  });


// open
//picker.open();

// open without focus
//picker.open(false);

// close
//picker.close();

// close with focus
//picker.close(true);

// reinit
//picker.start();

// destroy
//picker.stop();

// render
//picker.render();

// clear
//picker.clear();

/* parameters:
   value (default)
   select 
   highlight 
   view 
   min 
   max 
   open
   start
   id
   disable
   enable
*/
//picker.get(parameter);

/* parameters:
   clear
   select
   highlight
   view
   min
   max
   disable 
   enable
   interval
*/
//picker.set(parameter);
});
