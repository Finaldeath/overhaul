void main()
{
    object oAttacker = GetLastAttacker();

//* Should only register if hit with a ranged weapon
    if(GetWeaponRanged(GetLastWeaponUsed(oAttacker)))
    {
        SpeakOneLinerConversation();
        if(GetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST") > 0 &&
           GetLocalInt(GetModule(), "NW_PROLOGUE_PLOT") != 99)
        {
            if(GetDistanceToObject(oAttacker) > 12.0)
            {
                if(GetLevelByClass(CLASS_TYPE_BARBARIAN,oAttacker) > 0 ||
                   GetLevelByClass(CLASS_TYPE_BARD,oAttacker) > 0 ||
                   GetLevelByClass(CLASS_TYPE_FIGHTER,oAttacker) > 0 ||
                   GetLevelByClass(CLASS_TYPE_MONK,oAttacker) > 0 ||
                   GetLevelByClass(CLASS_TYPE_PALADIN,oAttacker) > 0 ||
                   GetLevelByClass(CLASS_TYPE_RANGER,oAttacker) > 0 )
                {
                    SetLocalInt(GetModule(),"NW_G_M1Q0BRanged",TRUE);
                    if(GetLocalInt(GetModule(),"NW_G_M1Q0BMelee"))
                    {
                        SetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST",2);
                    }
                }
                else
                {
                    SetLocalInt(GetModule(),"NW_G_M0Q01_NONFIGHTER_PASS",TRUE);
                }
                AssignCommand(GetNearestObjectByTag("M1Q0BHewwet"),SpeakOneLinerConversation("",oAttacker));

            }
            else
            {
                AssignCommand(GetNearestObjectByTag("M1Q0BHewwet"),SpeakOneLinerConversation("",oAttacker));
            }
        }
    }
}
