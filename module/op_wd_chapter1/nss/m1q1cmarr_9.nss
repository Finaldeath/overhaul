//::///////////////////////////////////////////////
//:: Smith Script
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 General Magic Item + Reagent smith
 system.
 Uses CustomToken #777
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 17, 2001
//:://////////////////////////////////////////////

#include "NW_O0_ITEMMAKER"
//#include "NW_I0_GENERIC"

int nnNumberOfCombos = 26;

void main()
{
    SetLocalString(OBJECT_SELF,"NW_L_MYFORGE","M1Q1CForge");
    SetLocalInt(OBJECT_SELF,"NW_L_COMBOS",nnNumberOfCombos);
    int nComboNumber = 1;
    // * setup combo one
    for (nComboNumber=1; nComboNumber <= nnNumberOfCombos; nComboNumber++)
    {

        switch (nComboNumber)
        {
// * Chromatic Breastplate
            case 1:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_ARMOR);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_GEM005");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_MAARCL058");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);
                // * Put Armor Class Value if ARMOR
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_AC",nComboNumber,6);

            break;

// * Scales of Truth
            case 2:
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_ARMOR);
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC15");
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_MAARCL059");
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_AC",nComboNumber,5);
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Whitebone Armor
            case 3:
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_ARMOR);
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC14");
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_MAARCL060");
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_AC",nComboNumber,3);
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Sentinel Axe
            case 4:
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_BATTLEAXE);
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WAXMBT008");
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

            // * Gladiator's Club
            case 5:
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_CLUB);
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC18");
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMCL008");
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Ironwood Mace
            case 6:
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_DIREMACE);
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC18");
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WDBMMA008");
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Double Axe of the Tall Kin
            case 7:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_DOUBLEAXE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WDBMAX008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);


            break;

// * Stonefire Great Axe
              case 8:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_GREATAXE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WAXMGR008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Harbringer Kin Greatsword
              case 9:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_GREATSWORD);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMGS009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Ravager Halberd
              case 10:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_HALBERD);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC17");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WPLMHB008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Ice Reaver Hand Axe
              case 11:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_HANDAXE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC17");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WAXMHN008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Ice Reaver Heavy Flail
              case 12:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_HEAVYFLAIL);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC17");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMFH008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Sword Saint Katana
              case 13:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_KATANA);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMKA008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Astral Blade Longsword
              case 14:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_LONGSWORD);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_GEM005");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMLS009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Storm Light Hammer
              case 15:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_LIGHTHAMMER);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_GEM005");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMHL008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Foundation Light Flail
              case 16:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_LIGHTFLAIL);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC18");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMFL008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Mace of Disruption
              case 17:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_LIGHTMACE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC15");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMML009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Drone Morning Star
              case 18:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_MORNINGSTAR);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC19");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMMS008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Namarra Rapier
              case 19:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_RAPIER);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC17");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMRP008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Desert Wind Scimitar
              case 20:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_SCIMITAR);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMSC008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Sea Reaver Scythe
              case 21:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_SCYTHE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WPLMSC008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Fey Duster Shortsword
              case 22:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_SHORTSWORD);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC19");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMSS008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Fey Spear
              case 23:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_SHORTSPEAR);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC19");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WPLMSS008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Golden Sickle
              case 24:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_SICKLE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC15");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSPMSC008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Uthgardt Ceremonial Two-bladed Sword
              case 25:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_TWOBLADEDSWORD);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC18");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WDBMSW008");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;

// * Rune Hammer
              case 26:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_WARHAMMER);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMHW009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,500);

            break;
        }






    }
//    SetListeningPatterns();    // Goes through and sets up which shouts the NPC will listen to.
//    WalkWayPoints();           // Looks to see if any Way Points in the module have the tag WP_ + NPC TAG + _0X, if so walk them

}

