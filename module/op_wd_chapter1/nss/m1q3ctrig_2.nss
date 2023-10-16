void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_Fired") == FALSE)
    {
        SetLocalInt(GetModule(),"NW_G_M1Q3MeldMet",TRUE);
        SetLocalInt(OBJECT_SELF,"NW_L_Fired",TRUE);
        int nNth = 1;
        object oDoor = GetNearestObjectByTag("M1Q3COuterDoor",OBJECT_SELF,nNth);
        while(GetIsObjectValid(oDoor))
        {
            SetLocked(oDoor,TRUE);
            AssignCommand(oDoor,ActionCloseDoor(oDoor));
            nNth++;
            oDoor = GetNearestObjectByTag("M1Q3COuterDoor",OBJECT_SELF,nNth);
        }
        //dryad warn
        object oDryad = GetNearestObjectByTag("M1Q3CDryad");
        AssignCommand(oDryad,SpeakOneLinerConversation());
        //meldanen appear
        location lLoc = GetLocation(GetNearestObjectByTag("WP_M1Q3CMeldanen"));
        object oMeldanen = CreateObject(OBJECT_TYPE_CREATURE,
                                        "M1Q3CMELDANEN",
                                        lLoc);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3),lLoc);
    }
}
