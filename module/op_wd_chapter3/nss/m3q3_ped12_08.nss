void main()
{
    //* Lock Door, Spawn in Fire Guardian
    if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") == 0)
    {
        ActionCloseDoor(GetObjectByTag("M3Q3DOOR12"));
        SetLocked(GetObjectByTag("M3Q3DOOR12"),TRUE);
        object oFire = CreateObject(OBJECT_TYPE_CREATURE,"M3Q3D_FIREELEM",GetLocation(GetWaypointByTag("WP_M3Q3FireGuard_Spawn")));
        object oFire2 = CreateObject(OBJECT_TYPE_CREATURE,"M3Q3D_FIREELEM",GetLocation(GetWaypointByTag("WP_M3Q3Fire2")));
        object oFire3 = CreateObject(OBJECT_TYPE_CREATURE,"M3Q3D_HELLHOUND",GetLocation(GetWaypointByTag("WP_M3Q3Fire3")));

        SetLocalInt(OBJECT_SELF,"NW_L_DOONCE", 1) ;
        ActionCastSpellAtObject(SPELL_FIREBALL, OBJECT_SELF, METAMAGIC_ANY, TRUE);
//        DelayCommand(4.0,AssignCommand(oFire, SpeakOneLinerConversation("",OBJECT_SELF)));
    }
}
