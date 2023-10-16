// random trap-component generator. If the player has ranks in Craft Traps Set Trap and he would find component,
// else he would find gold.

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oPC = GetLastOpenedBy();
    if(oPC == OBJECT_INVALID)
        oPC = GetLastKiller();
    int nHasCraft = 0;
    int nRand = d10(); // type of component
    int nRand2; // rand the gold or components amount
    if(GetSkillRank(SKILL_CRAFT_TRAP, oPC) > 0 && GetSkillRank(SKILL_SET_TRAP, oPC) > 0)
        nHasCraft = 1;
    else
    {
        nRand2 = Random(20) + 1;
        CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF, nRand2 * 5 + nRand);
        return;
    }
    nRand2 = d4(3);
    int i;
    switch(nRand)
    {
        case 1:
            CreateItemOnObject("X1_WMGRENADE001", OBJECT_SELF, nRand2);
            break;
        case 2:
            CreateItemOnObject("X1_WMGRENADE002", OBJECT_SELF, nRand2);
            break;
        case 3:
            CreateItemOnObject("X1_WMGRENADE003", OBJECT_SELF, nRand2);
            break;
        case 4:
            CreateItemOnObject("X1_WMGRENADE004", OBJECT_SELF, nRand2);
            break;
        case 5:
            CreateItemOnObject("X1_WMGRENADE005", OBJECT_SELF, nRand2);
            break;
        case 6:
            CreateItemOnObject("X1_WMGRENADE006", OBJECT_SELF, nRand2);
            break;
        case 7:
            CreateItemOnObject("X1_WMGRENADE007", OBJECT_SELF, nRand2);
            break;
        case 8:
            for(i = 1; i <= nRand2; i++)
                CreateItemOnObject("NW_IT_MSMLMISC11");
            break;
        case 9:
            for(i = 1; i <= nRand2; i++)
                CreateItemOnObject("NW_IT_MSMLMISC13");
            break;
        case 10:
            for(i = 1; i <= nRand2; i++)
                CreateItemOnObject("X1_IT_MSMLMISC01");
            break;
    }
    return;



}
