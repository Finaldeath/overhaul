// the PC is male and has not already come on to Katriana

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(OBJECT_SELF, "q1_Katriana_Comeon") == 0) &&
               (GetGender(GetPCSpeaker()) == GENDER_MALE));
    return iResult;
}
