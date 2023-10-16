// the PC is in sight of the minister or the nurse
// or in sight of the other three (and not thought a god)

int StartingConditional()
{
    object oPriest = GetObjectByTag("Q5B_PRIEST");
    object oNurse = GetObjectByTag("Q5A_NURSE");
    object oWorship1 = GetObjectByTag("Q5A_RIFKIN");
    object oWorship2 = GetObjectByTag("Q5A_TALISSICIA");
    object oWorship3 = GetObjectByTag("Q5A_TELNIX");
    int nSkill = GetSkillRank(SKILL_PICK_POCKET, GetPCSpeaker());

    if (nSkill > 0)
    {
        return FALSE;
    }

    if (GetLocalInt(OBJECT_SELF, "q5b_tried_swipe") != 0)
    {
        return FALSE;
    }

    if ((GetIsObjectValid(oPriest)) && (GetObjectSeen(GetPCSpeaker(), oPriest)))
    {
        return TRUE;
    }
    if ((GetIsObjectValid(oNurse)) && (GetObjectSeen(GetPCSpeaker(), oNurse)))
    {
        return TRUE;
    }
    if ((GetIsObjectValid(oWorship1)) && (GetObjectSeen(GetPCSpeaker(), oWorship1)) && (GetLocalInt(GetPCSpeaker(), "X1_PCISGOD") != 10))
    {
        return TRUE;
    }
    if ((GetIsObjectValid(oWorship2)) && (GetObjectSeen(GetPCSpeaker(), oWorship2)) && (GetLocalInt(GetPCSpeaker(), "X1_PCISGOD") != 10))
    {
        return TRUE;
    }
    if ((GetIsObjectValid(oWorship3)) && (GetObjectSeen(GetPCSpeaker(), oWorship3)) && (GetLocalInt(GetPCSpeaker(), "X1_PCISGOD") != 10))
    {
        return TRUE;
    }

    return FALSE;
}
