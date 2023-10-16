#include "m2_i0_plot"
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetPartyLocalInt(GetPCSpeaker(), "M2Q1A09ELTRA_PLOT") == 10 &&
             ((GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q01TIMASKDEATH")) && GetLocalInt(OBJECT_SELF,"NW_L_DeathReturned") == 0) ||
              (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q01TIMASKLIFE"))  && GetLocalInt(OBJECT_SELF,"NW_L_LifeReturned") == 0) ||
              (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q01TIMASKFIRE"))  && GetLocalInt(OBJECT_SELF,"NW_L_FireReturned") == 0) ||
              (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q01TIMASKICE"))  && GetLocalInt(OBJECT_SELF,"NW_L_IceReturned") == 0) ||
              (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q01TIMASKRESON")) && GetLocalInt(OBJECT_SELF,"NW_L_ResonReturned") == 0));
    return iResult;
}
