// * Spawn in the appropriate dryad or dwarf
// * fight based on the position of the snowglobe

void CreateDryad()
{
    CreateObject(OBJECT_TYPE_CREATURE, "M3Q3C02_DRYAD_1", GetLocation(GetNearestObjectByTag("M3Q3_WayGlobe")));
}
void CreateDwarf()
{
    CreateObject(OBJECT_TYPE_CREATURE, "M3Q3C02_DWARF_1", GetLocation(GetNearestObjectByTag("M3Q3_WayGlobe")));
}
void main()
{
  if (GetIsPC(GetEnteringObject()) == TRUE)
  if (GetLocalInt(OBJECT_SELF, "NW_L_DOONCE") == 0)
  {
    // * Dwarfs are Hostile
   if (GetLocalInt(GetModule(), "NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 1) // * Should be 1
   {
       CreateDryad();
//       CreateDwarf();
//       CreateDwarf();
       CreateDwarf();
   }
    // * Dryads are Hostile
    else
   if (GetLocalInt(GetModule(), "NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 10)
   {
      CreateDwarf();
//      CreateDryad();
      CreateDryad();
      CreateDryad();
   }
   SetLocalInt(OBJECT_SELF, "NW_L_DOONCE",1);
  }
}
