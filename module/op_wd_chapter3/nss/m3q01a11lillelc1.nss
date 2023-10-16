void main()

{
   if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN") == 2)
       SetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN",3);

   if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN") == 0)
       SetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN",1);
       
}
