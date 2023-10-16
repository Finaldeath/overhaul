// if the nymph has already tried the seduction

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(OBJECT_SELF, "q2b_tried_seduction") == 1) ||
              (GetGender(GetPCSpeaker()) != GENDER_MALE));
    return iResult;
}
