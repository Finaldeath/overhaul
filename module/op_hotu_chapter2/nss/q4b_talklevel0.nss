//::///////////////////////////////////////////////
//:: q4b_talklevel0
//:://////////////////////////////////////////////
//:: Checks if character has not yet been talked to
//::
//////////////////////////////////////////////
//::
//:: Created By: Drew Karpyshyn
//:: Created On: August 15, 2003
//::
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL")==0;
    return iResult;
}
