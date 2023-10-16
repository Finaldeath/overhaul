#include "NW_I0_Plot"
int StartingConditional()
{
    object oArtifact = GetItemPossessedBy(GetPCSpeaker(),"ARTI_ITEM01");
    if (GetIsObjectValid(oArtifact))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
