//::///////////////////////////////////////////////
//:: x2_inc_sim
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: October 2nd
//:://////////////////////////////////////////////
const string S_PLAYER_SYMBOL  = "!";
const string S_WALL = "#";
const string S_ROOF = "#";
const string S_WHITESPACE = "    ";

const int nRowWidth = 10;
const int SIM_LEFTSIDE = 2;
const int SIM_RIGHTSIDE = 7;

int PUZZLE_SOLUTION = 1;

const int OS_PUZZLE1 = 1;
const int OS_IX = 2;

// * Redraws the screen
void sim_DrawScreen(int nType);
// * Move position of token in nRowNum in nDirection (1 left, 2 right) by nAmount
void sim_AdjustRow(int nRowNum, int nDirection, int nAmount=1);

// *returns true if the puzzle has been solved correctly
int sim_IsPuzzleCorrect();

// * initializes puzzle- does this each time conversation is started
void sim_InitPuzzle()
{
    SetLocalInt(GetModule(), "X2_SIM_ROW1POS", 1);
    SetLocalInt(GetModule(), "X2_SIM_ROW2POS", 3);
    SetLocalInt(GetModule(), "X2_SIM_ROW3POS", 5);
    SetLocalInt(GetModule(), "X2_SIM_ROW4POS", 8);
}
int sim_GetRandomDamageType()
{
    int nRandom = Random(12) + 1;
    switch (nRandom)
    {
        case 1: return DAMAGE_TYPE_BLUDGEONING;
        case 2: return DAMAGE_TYPE_PIERCING;
        case 3: return DAMAGE_TYPE_SLASHING;
        case 4: return DAMAGE_TYPE_MAGICAL;
        case 5: return DAMAGE_TYPE_ACID;
        case 6: return DAMAGE_TYPE_COLD;
        case 7: return DAMAGE_TYPE_DIVINE;
        case 8: return DAMAGE_TYPE_ELECTRICAL;
        case 9: return DAMAGE_TYPE_FIRE;
        case 10: return DAMAGE_TYPE_NEGATIVE;
        case 11: return DAMAGE_TYPE_POSITIVE;
        case 12: return DAMAGE_TYPE_SONIC;
    }
    return DAMAGE_TYPE_BLUDGEONING;

}
// * Takes 10% health
void sim_DamagePerMove()
{
    object oPC = GetPCSpeaker();
    int nDamage = GetMaxHitPoints(oPC) / 10;
    int nDamageType =  sim_GetRandomDamageType();
    effect eDamage = EffectDamage(nDamage, nDamageType);

    effect eVis = EffectVisualEffect(VFX_IMP_HARM);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
}

// * Move position of token in nRowNum in nDirection (1 left, 2 right) by nAmount
void sim_AdjustRow(int nRowNum, int nDirection, int nAmount=1)
{
    // * shifting left is negative
    if    (nDirection == 1)
      nAmount = -1 * nAmount;

    int nCurrentPosition =GetLocalInt(GetModule(), "X2_SIM_ROW" + IntToString(nRowNum)+ "POS");
    if (nCurrentPosition <= SIM_LEFTSIDE)
    {
        nCurrentPosition = SIM_LEFTSIDE;
    }
    if (nCurrentPosition >= SIM_RIGHTSIDE)
    {
        nCurrentPosition = SIM_RIGHTSIDE;
    }
    SetLocalInt(GetModule(),"X2_SIM_ROW" + IntToString(nRowNum)+ "POS",
              nCurrentPosition + nAmount);

    //sim_DamagePerMove();
}

// * RowPosition: where to show the player
string sim_BuildRow(string sType, int nSize, string sBorder = "", int nRowPosition=-1)
{
    int i = 0;
    string sRow = "";
    if (sBorder != "")
    {
        sRow = sBorder;
    }
    for (i = 1; i<= nSize; i++)
    {
        if (nRowPosition == i)
        {
            sRow = sRow + S_PLAYER_SYMBOL;
        }
        else
            sRow = sRow + sType;
    }
    if (sBorder != "")
    {
        sRow = sRow + sBorder;
    }
    return sRow;
}

// * Redraws the screen
void sim_DrawScreen(int nType)
{

    if (nType == OS_IX)
    {
        string sRow0 = sim_BuildRow(S_ROOF, 41, "  ");
        string sRow1 = sim_BuildRow(S_WHITESPACE, 20, S_WALL);
        string sText = S_WALL+"root@faerun.prime.com:/games/nwn#                  "+S_WALL;

        string sRow3 = sim_BuildRow(S_WHITESPACE, 20, S_WALL);
        string sRow4 = sim_BuildRow(S_WHITESPACE, 20, S_WALL);
        string sRowE = sim_BuildRow(S_ROOF,41, "  ");
         // * Draw 'ix screen
       SetCustomToken(5487, sRow0);
       SetCustomToken(5488, sRow1);
       SetCustomToken(5489, sText);
       SetCustomToken(5490, sRow3);
       SetCustomToken(5491, sRow4);
       SetCustomToken(5492, sRowE);
       return;
    }
    else
    if (nType == OS_PUZZLE1)
    {
        // * Get player column and row
        // * I have just changed a position within a column for the screen to redraw
        // * so I need to find the position of all the tokens in all the columns
        int nRow1Position = GetLocalInt(GetModule(), "X2_SIM_ROW1POS");
        int nRow2Position = GetLocalInt(GetModule(), "X2_SIM_ROW2POS");
        int nRow3Position = GetLocalInt(GetModule(), "X2_SIM_ROW3POS");
        int nRow4Position = GetLocalInt(GetModule(), "X2_SIM_ROW4POS");


        string sRow0 = sim_BuildRow(S_ROOF, nRowWidth +3, "  ");
        string sRow1 = sim_BuildRow(S_WHITESPACE, 8, S_WALL, nRow1Position);
        string sRow2 = sim_BuildRow(S_WHITESPACE, 8, S_WALL, nRow2Position);
        string sRow3 = sim_BuildRow(S_WHITESPACE, 8, S_WALL, nRow3Position);
        string sRow4 = sim_BuildRow(S_WHITESPACE, 8, S_WALL, nRow4Position);
        string sRowE = sim_BuildRow(S_ROOF, nRowWidth +3, "  ");
        SetCustomToken(5487, sRow0);
        SetCustomToken(5488, sRow1);
        SetCustomToken(5489, sRow2);
        SetCustomToken(5490, sRow3);
        SetCustomToken(5491, sRow4);
        SetCustomToken(5492, sRowE);
         }
}

// *returns true if the puzzle has been solved correctly
int sim_IsPuzzleCorrect()
{
    // * puzzle solution 1 = All lined up vertically.
    if (PUZZLE_SOLUTION == 1)
    {
        int nRow1Position = GetLocalInt(GetModule(), "X2_SIM_ROW1POS");
        int nRow2Position = GetLocalInt(GetModule(), "X2_SIM_ROW2POS");
        int nRow3Position = GetLocalInt(GetModule(), "X2_SIM_ROW3POS");
        int nRow4Position = GetLocalInt(GetModule(), "X2_SIM_ROW4POS");
        if (nRow1Position == nRow2Position && nRow1Position == nRow3Position && nRow1Position == nRow4Position)
        {
            return TRUE;
        }
    }

    return FALSE;
}

