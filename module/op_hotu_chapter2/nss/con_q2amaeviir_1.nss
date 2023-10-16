// con_q2amaeviir_1
//Return TRUE if the PC is MALE
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetGender(oPC) == GENDER_MALE)
        return TRUE;
    return FALSE;
}
