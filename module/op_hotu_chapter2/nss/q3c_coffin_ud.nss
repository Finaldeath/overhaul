// Event 101: set as occupied by a vampire

void Jump(object oMonk)
{
    object oWP = GetNearestObjectByTag("q3c_wp_master_jump");
    effect eVis = EffectVisualEffect(VFX_IMP_HARM);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if(!GetIsInCombat(oMonk))
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
        AssignCommand(oMonk, ActionJumpToObject(oWP));
        AssignCommand(oMonk, ActionAttack(oPC));
    }
}

void SpawnVampire()
{
    if(GetLocalInt(OBJECT_SELF, "HAS_VAMPIRE") == 1)
    {
        string sTag = GetTag(OBJECT_SELF);
        int nNumLen = GetStringLength(sTag) - GetStringLength("q3c_coffin");
        int nNum = StringToInt(GetStringRight(sTag, nNumLen));
        object oWP = GetNearestObjectByTag("q3c_wp_spawn_vampire");
        effect eVis = EffectVisualEffect(VFX_IMP_HARM);
        string sBP;
        if(nNum == 9) // master monk
            sBP = "q3_elder_monk";
        else if(nNum == 11) // shadow master
            sBP = "q3_shad_master";
        else if(nNum == 99) // Armand
            return; // no spawning for him
        else
            sBP = "cultistguard";
        object oMonk = CreateObject(OBJECT_TYPE_CREATURE, sBP, GetLocation(oWP));
        if(nNum == 11) // setting combat status for shadow master
            SetLocalInt(oMonk, "STATUS", 6);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
        SetLocalInt(OBJECT_SELF, "HAS_VAMPIRE", 0);
        if(nNum == 9 | nNum == 11)
        {
            object oDoor = GetNearestObjectByTag("q3c_master_monk_door");
            if(oDoor != OBJECT_INVALID && !GetIsOpen(oDoor))
            {
                Jump(oMonk);
                return;
            }
        }
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        AssignCommand(oMonk, ActionAttack(oPC));
        SetLocalInt(oMonk, "COFFIN", nNum);
   }
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101)
    {
        DelayCommand(5.0, SetLocalInt(OBJECT_SELF, "HAS_VAMPIRE", 1));
        DelayCommand(80.0, SpawnVampire());
    }
}
