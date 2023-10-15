void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(OBJECT_SELF,"NW_L_FireOnce") == FALSE)
    {
        int nNth = 0;
        object oWP = GetObjectByTag("WP_M1Q0EGobSpawn",nNth);
        while(GetIsObjectValid(oWP))
        {
            CreateObject(OBJECT_TYPE_CREATURE,"m1q0d19goblin",GetLocation(oWP));
            nNth++;
            oWP = GetObjectByTag("WP_M1Q0EGobSpawn",nNth);
        }
        CreateObject(OBJECT_TYPE_CREATURE,"M1Q0ECHIEF",GetLocation(GetObjectByTag("WP_M1Q0EChief")));
        SetLocalInt(OBJECT_SELF,"NW_L_FireOnce",TRUE);
    }
}
