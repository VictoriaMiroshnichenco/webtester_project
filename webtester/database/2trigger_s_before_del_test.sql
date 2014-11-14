CREATE OR REPLACE FUNCTION public.before_del_test (
)
RETURNS trigger AS'
DECLARE

BEGIN
UPDATE result SET comment = old.name WHERE id_result=id_test ;
return OLD;

END;
'LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

CREATE TRIGGER trigger_s_before_del_test
  BEFORE DELETE 
  ON public.test FOR EACH ROW 
  EXECUTE PROCEDURE public.before_del_test();