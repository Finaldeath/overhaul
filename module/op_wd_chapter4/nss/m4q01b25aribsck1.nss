////Check if conversation aborted early and Aribeth not surrendered

int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) &&
              GetLocalInt(GetModule(), "NW_M4Q1_AribethHostile") ==1;

    return iResult;
}
