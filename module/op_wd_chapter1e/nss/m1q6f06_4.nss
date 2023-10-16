void main()
{
    if (GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M1Q6FHelmGem")))
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q6F2_GuardActive",FALSE);
        DestroyObject(GetNearestObjectByTag("M1Q6F2_Trigger"));
        string sWP;
        int nNth = 1;
        object oGuard = GetNearestObjectByTag("M1Q6F06Helm_Guard" + IntToString(nNth));
        while(GetIsObjectValid(oGuard))
        {
            sWP = "WP_M1Q6F06Helm_Guard" + IntToString(nNth);
            //AssignCommand(oGuard,SpeakString(sWP));
            SetLocalInt(oGuard,"NW_L_SpeakLine",TRUE);
            AssignCommand(oGuard,SpeakOneLinerConversation());
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),oGuard);
            AssignCommand(oGuard,JumpToObject(GetObjectByTag(sWP)));
            nNth++;
            oGuard = GetNearestObjectByTag("M1Q6F06Helm_Guard" + IntToString(nNth));
        }
        if(GetLocalInt(OBJECT_SELF,"NW_L_RewardGiven") == FALSE)
        {
            SetLocalInt(OBJECT_SELF,"NW_L_RewardGiven",TRUE);
            GiveXPToCreature(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC),50);
        }
    }
}
