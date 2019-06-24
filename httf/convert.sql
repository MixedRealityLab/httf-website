update bolt_field_value set name='body' where name='blocks';
update bolt_field_value set block='parablock' where block='textsection';
update bolt_field_value set block='dualparablock' where block='text2colsection';
update bolt_field_value set block='imageblock' where block='imagesection';
update bolt_field_value set block='videoblock' where block='videosection';