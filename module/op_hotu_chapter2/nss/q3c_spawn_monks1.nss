// Spawn a scaled group of monks

#include "NW_I0_GENERIC"

int GetNumPlayers()
{
    int n = 0;
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        n++;
        oPC = GetNextPC();
    }
    return n;
}

void main()
{
    string sWPBaseTag = "q3c_wp_monk_sp";
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    int nPCLevel = GetCharacterLevel(oPC);
    int nNumPlayers = GetNumPlayers();
    int nMonksNum = 3;

    if(nPCLevel < 19)
        nMonksNum = 3;
    else if(nPCLevel >= 20 && nPCLevel < 22)
        nMonksNum = 4;
    else if(nPCLevel >= 22 && nPCLevel < 24)
        nMonksNum = 5;
    else if(nPCLevel >= 24)
        nMonksNum = 6;

    nMonksNum += (nNumPlayers - 1);

    if(nMonksNum > 7)
        nMonksNum = 7;

    int i = 1;
    string sWPTag;
    object oWP;
    object oStatue = GetObjectByTag("q3c_statue");
    object oMonk;

    for(i = 1; i <= nMonksNum; i++)
    {
        sWPTag = sWPBaseTag + IntToString(i);
        oWP = GetWaypointByTag(sWPTag);
        oMonk = CreateObject(OBJECT_TYPE_CREATURE, "cultistguard", GetLocation(oWP));
        SetLocalInt(oMonk, "COFFIN", i); // used to place the monk in a coffin when it dies.
        AssignCommand(oMonk, SetFacingPoint(GetPosition(oStatue)));
        AssignCommand(oMonk, PlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.2, 99999.9));
    }

}
