#include "nw_i0_plot"

void main()
{
    object oStore = GetNearestObjectByTag("MT_STORE");
    object oPC = GetPCSpeaker();
    int nSellMarkUp;
    int nBuyMarkDown;

    int nPersuade = GetAbilityModifier(ABILITY_CHARISMA, oPC) + GetSkillRank(SKILL_PERSUADE, oPC);

    if (nPersuade < 5)
    {
        nSellMarkUp = 100;
        nBuyMarkDown = 20;
    }

    else if (nPersuade < 10)
    {
        nSellMarkUp = 90;
        nBuyMarkDown = 30;
    }

    else if (nPersuade < 15)
    {
        nSellMarkUp = 80;
        nBuyMarkDown = 40;
    }

    else if (nPersuade < 20)
    {
        nSellMarkUp = 75;
        nBuyMarkDown = 45;
    }

    else
    {
        nSellMarkUp = 70;
        nBuyMarkDown = 50;
    }

    int nRepMod = GetReputation(OBJECT_SELF, oPC) / 10;

    nSellMarkUp -= nRepMod;
    nBuyMarkDown += nRepMod;


    gplotAppraiseOpenStore(oStore, oPC, nSellMarkUp, nBuyMarkDown);


    // The remaining code used for testing custom items
    /*
    if (GetLocalInt(GetModule(), "N_TEST") == 1)
    {
        object o = GetFirstItemInInventory(oStore);
        int nMarker = 0;

        while (o != OBJECT_INVALID)
        {
            if (GetStringUpperCase(GetResRef(o)) != GetTag(o))
            {
                SendMessageToPC(oPC, "Trouble with item : " + GetTag(o));
                nMarker = 1;
            }

            o = GetNextItemInInventory(oStore);
        }

        if (nMarker == 0)
            SendMessageToPC(oPC, "All items in this store checked out fine.");

        else
            SendMessageToPC(oPC, "Ran into a problem with items in this store.  See details above.");
    }
    */
}
