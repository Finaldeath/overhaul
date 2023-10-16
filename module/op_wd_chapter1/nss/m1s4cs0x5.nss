/*
Checks if person has champion medallion
40% chance to fall through.
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: April 08, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int l_iResult;
    object oSpeaker = GetLastSpeaker();
    l_iResult = GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S04IBADGELVL04")) &&
                d100() > 40;
    return l_iResult;
}
