////Check if conversation aborted early and Aribeth has surrendered

int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) &&
              GetLocalInt(GetModule(), "NW_M4Q1_AribethHostile") ==99;

    return iResult;
}

