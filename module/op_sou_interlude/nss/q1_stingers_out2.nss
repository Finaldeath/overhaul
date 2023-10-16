// Digging-out stingers from all waypoints around the trigger

#include "nw_i0_generic"

// Determines how many stingers to create (nDifficulty 0-> easy, 1->normal, 2->hard
int GetStingersNum(int nDifficulty)
{
    int nTotalLevels = 0;
    object oHenchman;
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        nTotalLevels += GetCharacterLevel(oPC);
        oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
        if(oHenchman != OBJECT_INVALID)
            nTotalLevels += GetCharacterLevel(oHenchman);

        oPC = GetNextPC();
    }
    int nStingersNum = 2;
    // determine number for normal
    if(nTotalLevels <= 7) // a single player
        nStingersNum = 2;
    else if(nTotalLevels > 8 && nTotalLevels <= 20)
        nStingersNum = 3;
    else
        nStingersNum = 4;

    if(nDifficulty == 1)
        nStingersNum += 1;
    else if(nDifficulty == 2)
        nStingersNum += 4;

    return nStingersNum;
}

void CreateStinger(object oWP)
{
    object oStinger = CreateObject(OBJECT_TYPE_CREATURE, "q1_stinger", GetLocation(oWP));
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    DelayCommand(0.5, AssignCommand(oStinger, ActionAttack(oPC)));
}

void BringStingers(object oWP)
{
    effect eDust = EffectVisualEffect(137);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDust, GetLocation(oWP));
    DelayCommand(0.5, CreateStinger(oWP));
}

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    int n = 1;
    int nCount = GetStingersNum(0);
    object oWP = GetNearestObjectByTag("Q1_WP_STINGER_SP1", OBJECT_SELF, n);
    while (oWP != OBJECT_INVALID)
    {
        float fDistance = GetDistanceBetween(OBJECT_SELF, oWP);
        if(fDistance > 20.0)
            return;
        BringStingers(oWP);
        if(n == nCount)
            return;
        n++;
        oWP = GetNearestObjectByTag("Q1_WP_STINGER_SP" + IntToString(n), OBJECT_SELF);
    }
}
