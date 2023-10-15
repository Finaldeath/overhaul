void main()
{
    object oAttacker = GetLastAttacker();
    if(GetLocalInt(GetModule(), "NW_PROLOGUE_PLOT") != 99)
    {
        if(GetLevelByClass(CLASS_TYPE_BARBARIAN,oAttacker) > 0 ||
           GetLevelByClass(CLASS_TYPE_BARD,oAttacker) > 0 ||
           GetLevelByClass(CLASS_TYPE_FIGHTER,oAttacker) > 0 ||
           GetLevelByClass(CLASS_TYPE_MONK,oAttacker) > 0 ||
           GetLevelByClass(CLASS_TYPE_PALADIN,oAttacker) > 0 ||
           GetLevelByClass(CLASS_TYPE_RANGER,oAttacker) > 0 )
        {
            SetLocalInt(GetModule(),"NW_G_M1Q0BMelee",TRUE);
            if(GetLocalInt(GetModule(),"NW_G_M1Q0BRanged"))
            {
                SetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST",2);
            }
        }
        else
        {
            SetLocalInt(GetModule(),"NW_G_M0Q01_NONFIGHTER_PASS2",TRUE);
        }
        AssignCommand(GetNearestObjectByTag("M1Q0BDendy"),SpeakOneLinerConversation());
    }
}
