//////Check if PC has ring and is male and was one who convinced Aribeth to Surrender
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"ARIBETH_RING")) &&
              GetGender(GetPCSpeaker()) == GENDER_MALE &&
              GetLocalObject(GetModule(), "M4Q01SURRENDER") == GetPCSpeaker();
    return iResult;
}

