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
    SetLocalString(OBJECT_SELF,"NW_L_MYFORGE","sM3Q1MyForge");
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
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_MAARCL061");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,20000);
                // * Put Armor Class Value if ARMOR
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_AC",nComboNumber,6);

            break;

// * Scales of Truth
            case 2:
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_ARMOR);
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC15");
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_MAARCL062");
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_AC",nComboNumber,5);
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,20000);

            break;

// * Whitebone Armor
            case 3:
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_ARMOR);
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC14");
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_MAARCL063");
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_AC",nComboNumber,3);
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,20000);

            break;

// * Sentinel Axe
            case 4:
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_BATTLEAXE);
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WAXMBT009");
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,25000);

            break;

            // * Gladiator's Club
            case 5:
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_CLUB);
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC18");
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMCL009");
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,20000);

            break;

// * Ironwood Mace
            case 6:
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_DIREMACE);
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC18");
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WDBMMA009");
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,12000);

            break;

// * Double Axe of the Tall Kin
            case 7:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_DOUBLEAXE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WDBMAX009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,15000);


            break;

// * Stonefire Great Axe
              case 8:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_GREATAXE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WAXMGR010");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,20000);

            break;

// * Harbringer Kin Greatsword
              case 9:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_GREATSWORD);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMGS010");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,20000);

            break;

// * Ravager Halberd
              case 10:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_HALBERD);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC17");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WPLMHB009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,30000);

            break;

// * Ice Reaver Hand Axe
              case 11:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_HANDAXE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC17");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WAXMHN009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,22000);

            break;

// * Ice Reaver Heavy Flail
              case 12:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_HEAVYFLAIL);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC17");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMFH009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,20000);

            break;

// * Sword Saint Katana
              case 13:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_KATANA);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMKA009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,30000);

            break;

// * Astral Blade Longsword
              case 14:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_LONGSWORD);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_GEM005");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMLS011");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,22000);

            break;

// * Storm Light Hammer
              case 15:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_LIGHTHAMMER);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_GEM005");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMHL009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,20000);

            break;

// * Foundation Light Flail
              case 16:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_LIGHTFLAIL);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC18");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMFL009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,25000);

            break;

// * Mace of Disruption
              case 17:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_LIGHTMACE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC15");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMML010");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,10000);

            break;

// * Drone Morning Star
              case 18:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_MORNINGSTAR);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC19");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMMS009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,25000);

            break;

// * Namarra Rapier
              case 19:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_RAPIER);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC17");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMRP009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,12000);

            break;

// * Desert Wind Scimitar
              case 20:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_SCIMITAR);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMSC009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,22000);

            break;

// * Sea Reaver Scythe
              case 21:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_SCYTHE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WPLMSC009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,15000);

            break;

// * Fey Duster Shortsword
              case 22:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_SHORTSWORD);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC19");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSWMSS010");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,12000);

            break;

// * Fey Spear
              case 23:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_SHORTSPEAR);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC19");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WPLMSS009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,30000);

            break;

// * Golden Sickle
              case 24:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_SICKLE);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC15");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WSPMSC009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,10000);

            break;

// * Uthgardt Ceremonial Two-bladed Sword
              case 25:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_TWOBLADEDSWORD);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC18");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WDBMSW009");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,15000);

            break;

// * Rune Hammer
              case 26:
                // * Put Base Item Type Here
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_BASETYPE", nComboNumber, BASE_ITEM_WARHAMMER);
                // * Put Reagent RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REAGENT_1",nComboNumber, "NW_IT_MSMLMISC16");
                // * Put Item Created RESREF
                SetLocalArrayString(OBJECT_SELF,"NW_COMBO_REWARD",nComboNumber,"NW_WBLMHW010");
                //* Put Item Cost
                SetLocalArrayInt(OBJECT_SELF,"NW_COMBO_REWARD_GOLD",nComboNumber,20000);

            break;
        }






    }
//    SetListeningPatterns();    // Goes through and sets up which shouts the NPC will listen to.
//    WalkWayPoints();           // Looks to see if any Way Points in the module have the tag WP_ + NPC TAG + _0X, if so walk them

}

