// * Spawn in  Obould Many-Arrows and unlock the door to his chamber.
void main()
{
   if (GetLocalInt(OBJECT_SELF, "NW_L_SPAWN_CHIEF") == 0)
   {
        object oDoor= GetObjectByTag("M3Q4B_OBOULDDOOR");
        SetLocked(oDoor,FALSE);
        CreateObject(OBJECT_TYPE_CREATURE, "M3QB04_OBOULD",
            GetLocation(GetObjectByTag("M3Q4B05_SPAWN_O")));
        SetLocalInt(OBJECT_SELF, "NW_L_SPAWN_CHIEF", 1) ;
   }
}
