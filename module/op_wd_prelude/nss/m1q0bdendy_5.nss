void main()
{
    object oAttacker = GetLastAttacker();
    if(GetWeaponRanged(GetLastWeaponUsed(oAttacker)) == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "Generic_Surrender",1);
        object oTarget = GetFirstObjectInShape(SHAPE_SPHERE,
                                               RADIUS_SIZE_HUGE,
                                               GetLocation(OBJECT_SELF));
        while(GetIsObjectValid(oTarget))
        {
            if(oTarget != OBJECT_SELF)
            {
                if(GetIsEnemy(oTarget))
                {
                    AdjustReputation(oTarget, OBJECT_SELF, 50);
                    ClearPersonalReputation(oTarget);
                    SetIsTemporaryFriend(oTarget);
                }
                AssignCommand(oTarget, ClearAllActions());
                AssignCommand(oTarget,ActionAttack(OBJECT_INVALID));
            }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE,
                                           RADIUS_SIZE_HUGE,
                                           GetLocation(OBJECT_SELF));
        }
        ClearAllActions();
        if(GetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST") > 0)
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
        }
        SpeakOneLinerConversation();
    }
}

