#include "M1_Plot"
void main()
{
    string sTag = "M1Q04ISMUGCOIN";
    object oPC = GetPCSpeaker();
    int nCost = 5;
    int nCount;
    object oCoin = GetFirstItemInInventory(oPC);
    while(GetIsObjectValid(oCoin) && nCount < nCost)
    {
        if(GetTag(oCoin) == sTag)
        {
            nCount = nCount + GetNumStackedItems(oCoin);
            DestroyObject(oCoin);
        }
        oCoin = GetNextItemInInventory(GetPCSpeaker());
    }
    if(nCount > nCost)
    {
       DelayCommand(0.1,GiveChange(GetPCSpeaker(),nCount - nCost));
    }
}
