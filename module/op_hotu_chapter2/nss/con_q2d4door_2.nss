//con_q2d4door_2
//Check to see if the PC has open lock skill

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetSkillRank(SKILL_OPEN_LOCK, oPC) > 0)
        return TRUE;
    return FALSE;
}
