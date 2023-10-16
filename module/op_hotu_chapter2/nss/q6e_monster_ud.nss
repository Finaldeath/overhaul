// Talon's temple monster death:
// - Teleport player out of arena and init dialog with cleric
// - re-join henchmen

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
        object oCleric = GetNearestObjectByTag("q6_priest");
        object oPC = GetLocalObject(oCleric, "FIGHTING_PC");
        SetLocalInt(oCleric, "STATUS", 6); // challenge completed
        object oWPJump = GetWaypointByTag("q6e_wp_pc_jump2");
        effect eTeleport = EffectVisualEffect(VFX_IMP_UNSUMMON);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, GetLocation(oPC));
        DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, GetLocation(oWPJump)));
        DelayCommand(1.0, AssignCommand(oPC, JumpToObject(oWPJump)));

        // Checking to see whether the player finished all rounds:
        int nRound = GetLocalInt(oCleric, "ROUND");
        nRound++;
        SetLocalInt(oCleric, "ROUND", nRound);
        if(nRound == 5)
            SetLocalInt(oCleric, "STATUS", 3);
        DelayCommand(1.5, AssignCommand(oCleric, Talk(oPC)));


    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}
