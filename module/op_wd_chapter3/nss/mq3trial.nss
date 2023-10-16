//::///////////////////////////////////////////////
//:: The Uthgardt Trial Plot Include
//:: MQ3Trial.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  October 25, 2001
//:://////////////////////////////////////////////


// * declaration
void SetupTrialValues();
void SetLocalArrayInt(object oidObject, string sVarName, int nVarNum, int nValue);
int GetLocalArrayInt(object oidObject, string sVarName, int nVarNum);
void ApplyFactor(int nFactorNumber);
void AdjustJuror(int nJurorNum, int nAdjustment);
int CountInnocent();


// * implementation


//::///////////////////////////////////////////////
//:: SetupTrialValues
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Seeds the array with the appropriate trial factors
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: October 25, 2001
//:://////////////////////////////////////////////

void SetupTrialValues()
{
    int NUM_STATES = 35;  // * number of trial factors
    int NUM_JURY = 5;

    int i = 1;
    int k = 1;
    for (k = 1; k <= NUM_JURY; k++)
    for (i = 1; i <= NUM_STATES; i++)
    {
        // *
        // * values for Juror #1
        // *
        if (k == 1)
        {
            switch(i)
            {
                // * starting rating
                case 1:
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 2:
                    // * PC is good
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 1);
                    break;
                case 3:
                    // * PC is Chaotic
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 4:
                    // * PC is Female
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 0);
                    break;
                case 5:
                    // * PC is Druid or Ranger
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 0);
                    break;
                case 6:
                    // * Merc1 eye witness testimony
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 7:
                    // * Merc1 admits he didn't see fight start
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 1);
                    break;
                case 8:
                    // * Merc1 admits Uthgardt drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 9:
                    // * Merc1 admits drink was spiked
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 1);
                    break;
                case 10:
                    // * Merc1 admits dead merc was violent, hot head racist
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 1);
                    break;
                case 11:
                    // * Merc2 eye witness testimony
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 12:
                    // * Merc2 admits he didn't see who started fight
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 2);
                    break;
                case 13:
                    // * Merc2 admits drink was spiked
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 1);
                    break;
                case 14:
                    // * Merc2 admits dead Merc cheated at cards
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 1);
                    break;
                case 15:
                    // * Merc2 admits Uthgardt was drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 16:
                    // * Wife admits pride might drive husband to murder
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 17:
                    // * Wife says husband just wanted to talk to Merc
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 0);
                    break;
                case 18:
                    // * Wife emphasizes religious significance of heirlooms
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 19:
                    // * Wife claims husband victim of racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 20:
                    // * Warrior admits he killed for honor in past
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -2);
                    break;
                case 21:
                    // * Warrior tells version of self defense
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 0);
                    break;
                case 22:
                    // * Warrior admits he was drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 23:
                    // * Warrior claims he is victim of a racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 24:
                    // * Basic prosecution closing arguments
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 25:
                    // * Prosecution brings up heirlooms as motive
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 26:
                    // * Prosecution claims racism is a defense to justify murder
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 27:
                    // * Violent racism of victim brought up in closing or any insights during trial
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 1);
                    break;
                case 28:
                    // * Uthgardt drunk and not in right mind
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 29:
                    // * Uhtgardt's Drink spiked by Mercs
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 1);
                    break;
                case 30:
                    // * Dead merc cheated at cards and attacked Uthgardt for fear of retribution
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, 1);
                    break;
                case 31:
                    // * Religious heirlooms significance
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 32:
                    // * Uthgardt warrior is victim of racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -1);
                    break;
                case 33:
                    // * Juror 1 is bribed
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", i, -2);
                    break;
             }
        }

        // * values for Juror #2
        // *
        if (k == 2)
        {
            switch(i)
            {
                // * starting rating
                case 1:
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 0);
                    break;
                case 2:
                    // * PC is good
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 0);
                    break;
                case 3:
                    // * PC is Chaotic
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 4:
                    // * PC is Female
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 0);
                    break;
                case 5:
                    // * PC is Druid or Ranger
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 0);
                    break;
                case 6:
                    // * Merc1 eye witness testimony
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, -1);
                    break;
                case 7:
                    // * Merc1 admits he didn't see fight start
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 8:
                    // * Merc1 admits Uthgardt drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 9:
                    // * Merc1 admits drink was spiked
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 10:
                    // * Merc1 admits dead merc was violent, hot head racist
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 11:
                    // * Merc2 eye witness testimony
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, -1);
                    break;
                case 12:
                    // * Merc2 admits he didn't see who started fight
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 2);
                    break;
                case 13:
                    // * Merc2 admits drink was spiked
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 14:
                    // * Merc2 admits dead Merc cheated at cards
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 15:
                    // * Merc2 admits Uthgardt was drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 16:
                    // * Wife admits pride might drive husband to murder
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, -1);
                    break;
                case 17:
                    // * Wife says husband just wanted to talk to Merc
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 0);
                    break;
                case 18:
                    // * Wife emphasizes religious significance of heirlooms
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 0);
                    break;
                case 19:
                    // * Wife claims husband victim of racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, -1);
                    break;
                case 20:
                    // * Warrior admits he killed for honor in past
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, -2);
                    break;
                case 21:
                    // * Warrior tells version of self defense
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 22:
                    // * Warrior admits he was drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 23:
                    // * Warrior claims he is victim of a racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, -1);
                    break;
                case 24:
                    // * Basic prosecution closing arguments
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, -1);
                    break;
                case 25:
                    // * Prosecution brings up heirlooms as motive
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, -1);
                    break;
                case 26:
                    // * Prosecution claims racism is a defense to justify murder
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, -1);
                    break;
                case 27:
                    // * Violent racism of victim brought up in closing
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 28:
                    // * Uthgardt drunk and not in right mind
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 29:
                    // * Uhtgardt's Drink spiked by Mercs
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 30:
                    // * Dead merc cheated at cards and attacked Uthgardt for fear of retribution
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 1);
                    break;
                case 31:
                    // * Religious heirlooms significance
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 0);
                    break;
                case 32:
                    // * Uthgardt warrior is victim of racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, -1);
                    break;
                case 34:
                    // * Juror 2 is bribed
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", i, 25);
                    break;
             }
        }



        // * values for Juror #3
        // *
        if (k == 3)
        {
            switch(i)
            {
                // * starting rating
                case 1:
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 2:
                    // * PC is good
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 0);
                    break;
                case 3:
                    // * PC is Chaotic
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 0);
                    break;
                case 4:
                    // * PC is Female
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 0);
                    break;
                case 5:
                    // * PC is Druid or Ranger
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 6:
                    // * Merc1 eye witness testimony
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, -1);
                    break;
                case 7:
                    // * Merc1 admits he didn't see fight start
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 8:
                    // * Merc1 admits Uthgardt drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 0);
                    break;
                case 9:
                    // * Merc1 admits drink was spiked
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 10:
                    // * Merc1 admits dead merc was violent, hot head racist
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 11:
                    // * Merc2 eye witness testimony
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, -1);
                    break;
                case 12:
                    // * Merc2 admits he didn't see who started fight
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 13:
                    // * Merc2 admits drink was spiked
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 14:
                    // * Merc2 admits dead Merc cheated at cards
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 15:
                    // * Merc2 admits Uthgardt was drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 0);
                    break;
                case 16:
                    // * Wife admits pride might drive husband to murder
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, -1);
                    break;
                case 17:
                    // * Wife says husband just wanted to talk to Merc
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 18:
                    // * Wife emphasizes religious significance of heirlooms
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 19:
                    // * Wife claims husband victim of racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 20:
                    // * Warrior admits he killed for honor in past
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, -1);
                    break;
                case 21:
                    // * Warrior tells version of self defense
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 22:
                    // * Warrior admits he was drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 0);
                    break;
                case 23:
                    // * Warrior claims he is victim of a racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 24:
                    // * Basic prosecution closing arguments
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, -1);
                    break;
                case 25:
                    // * Prosecution brings up heirlooms as motive
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, -1);
                    break;
                case 26:
                    // * Prosecution claims racism is a defense to justify murder
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 0);
                    break;
                case 27:
                    // * Violent racism of victim brought up in closing
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 28:
                    // * Uthgardt drunk and not in right mind
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 29:
                    // * Uhtgardt's Drink spiked by Mercs
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 30:
                    // * Dead merc cheated at cards and attacked Uthgardt for fear of retribution
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 31:
                    // * Religious heirlooms significance
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
                case 32:
                    // * Uthgardt warrior is victim of racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", i, 1);
                    break;
             }
        }


        // * values for Juror #4
        // *
        if (k == 4)
        {
            switch(i)
            {
                // * starting rating
                case 1:
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 2:
                    // * PC is good
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 0);
                    break;
                case 3:
                    // * PC is Chaotic
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 0);
                    break;
                case 4:
                    // * PC is Female
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 1);
                    break;
                case 5:
                    // * PC is Druid or Ranger
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 0);
                    break;
                case 6:
                    // * Merc1 eye witness testimony
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 7:
                    // * Merc1 admits he didn't see fight start
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 1);
                    break;
                case 8:
                    // * Merc1 admits Uthgardt drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 9:
                    // * Merc1 admits drink was spiked
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 1);
                    break;
                case 10:
                    // * Merc1 admits dead merc was violent, hot head racist
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 1);
                    break;
                case 11:
                    // * Merc2 eye witness testimony
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 12:
                    // * Merc2 admits he didn't see who started fight
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 1);
                    break;
                case 13:
                    // * Merc2 admits drink was spiked
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 1);
                    break;
                case 14:
                    // * Merc2 admits dead Merc cheated at cards
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 3);
                    break;
                case 15:
                    // * Merc2 admits Uthgardt was drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 16:
                    // * Wife admits pride might drive husband to murder
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 17:
                    // * Wife says husband just wanted to talk to Merc
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 2);
                    break;
                case 18:
                    // * Wife emphasizes religious significance of heirlooms
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 19:
                    // * Wife claims husband victim of racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 20:
                    // * Warrior admits he killed for honor in past
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -2);
                    break;
                case 21:
                    // * Warrior tells version of self defense
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 0);
                    break;
                case 22:
                    // * Warrior admits he was drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 23:
                    // * Warrior claims he is victim of a racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 24:
                    // * Basic prosecution closing arguments
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 25:
                    // * Prosecution brings up heirlooms as motive
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 26:
                    // * Prosecution claims racism is a defense to justify murder
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -2);
                    break;
                case 27:
                    // * Violent racism of victim brought up in closing
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 1);
                    break;
                case 28:
                    // * Uthgardt drunk and not in right mind
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 29:
                    // * Uhtgardt's Drink spiked by Mercs
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 1);
                    break;
                case 30:
                    // * Dead merc cheated at cards and attacked Uthgardt for fear of retribution
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 2);
                    break;
                case 31:
                    // * Religious heirlooms significance
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 32:
                    // * Uthgardt warrior is victim of racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, -1);
                    break;
                case 35:
                    // * Juror 4 is bribed
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", i, 25);
                    break;
             }
        }


        // * values for Juror #5
        // *
        if (k == 5)
        {
            switch(i)
            {
                // * starting rating
                case 1:
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 2:
                    // * PC is good
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 0);
                    break;
                case 3:
                    // * PC is Chaotic
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 0);
                    break;
                case 4:
                    // * PC is Chaotic
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 0);
                    break;
                case 5:
                    // * PC is Druid or Ranger
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 0);
                    break;
                case 6:
                    // * Merc1 eye witness testimony
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, -1);
                    break;
                case 7:
                    // * Merc1 admits he didn't see fight start
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 8:
                    // * Merc1 admits Uthgardt drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, -1);
                    break;
                case 9:
                    // * Merc1 admits drink was spiked
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 10:
                    // * Merc1 admits dead merc was violent, hot head racist
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 11:
                    // * Merc2 eye witness testimony
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, -1);
                    break;
                case 12:
                    // * Merc2 admits he didn't see who started fight
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 13:
                    // * Merc2 admits drink was spiked
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 14:
                    // * Merc2 admits dead Merc cheated at cards
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 15:
                    // * Merc2 admits Uthgardt was drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, -1);
                    break;
                case 16:
                    // * Wife admits pride might drive husband to murder
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, -1);
                    break;
                case 17:
                    // * Wife says husband just wanted to talk to Merc
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 18:
                    // * Wife emphasizes religious significance of heirlooms
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 19:
                    // * Wife claims husband victim of racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 20:
                    // * Warrior admits he killed for honor in past
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, -1);
                    break;
                case 21:
                    // * Warrior tells version of self defense
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 22:
                    // * Warrior admits he was drunk and judgement impared
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, -1);
                    break;
                case 23:
                    // * Warrior claims he is victim of a racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 24:
                    // * Basic prosecution closing arguments
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, -1);
                    break;
                case 25:
                    // * Prosecution brings up heirlooms as motive
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, -1);
                    break;
                case 26:
                    // * Prosecution claims racism is a defense to justify murder
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 0);
                    break;
                case 27:
                    // * Violent racism of victim brought up in closing
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 28:
                    // * Uthgardt drunk and not in right mind
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, -1);
                    break;
                case 29:
                    // * Uhtgardt's Drink spiked by Mercs
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 30:
                    // * Dead merc cheated at cards and attacked Uthgardt for fear of retribution
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 31:
                    // * Religious heirlooms significance
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
                case 32:
                    // * Uthgardt warrior is victim of racist system
                    SetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", i, 1);
                    break;
             }
        }

    }
}

//::///////////////////////////////////////////////
//:: ApplyFactor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Applies the current trial 'factor' to all
    the jurors
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: October 25, 2001
//:://////////////////////////////////////////////

void ApplyFactor(int nFactorNumber)
{
    AdjustJuror(1, GetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR1", nFactorNumber));
    AdjustJuror(2, GetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR2", nFactorNumber));
    AdjustJuror(3, GetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR3", nFactorNumber));
    AdjustJuror(4, GetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR4", nFactorNumber));
    AdjustJuror(5, GetLocalArrayInt(GetModule(), "MQ3_JURY_TRIAL_JUROR5", nFactorNumber));
}


//::///////////////////////////////////////////////
//:: CountInnocent
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Returns the number of jurors who belief
  Rogan was innocent.
*/
//:://////////////////////////////////////////////
//:: Created By:    Brent
//:: Created On:    November 2001
//:://////////////////////////////////////////////

int CountInnocent()
{
    int nCount = 0;

    if (GetLocalInt(GetObjectByTag("MQ3JUROR1"), "M_JUROR_BELIEF") >=3)
        nCount = nCount + 1;

    if (GetLocalInt(GetObjectByTag("MQ3JUROR2"), "M_JUROR_BELIEF") >=3)
        nCount = nCount + 1;

    if (GetLocalInt(GetObjectByTag("MQ3JUROR3"), "M_JUROR_BELIEF") >=3)
        nCount = nCount + 1;

    if (GetLocalInt(GetObjectByTag("MQ3JUROR4"), "M_JUROR_BELIEF") >=3)
        nCount = nCount + 1;

    if (GetLocalInt(GetObjectByTag("MQ3JUROR5"), "M_JUROR_BELIEF") >=3)
        nCount = nCount + 1;




    return nCount;
}

//::///////////////////////////////////////////////
//:: AdjustJuror
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Adjusts the juror's belief by nAdjustment.
*/
//:://////////////////////////////////////////////
//:: Created By: Noel
//:: Created On: October 25, 2001
//:://////////////////////////////////////////////

void AdjustJuror(int nJurorNum, int nAdjustment)
{
    // * assumes the Juror exists in the modules
    object oJuror = GetObjectByTag("MQ3JUROR" + IntToString(nJurorNum));
    SetLocalInt(oJuror,"M_JUROR_BELIEF",GetLocalInt(oJuror, "M_JUROR_BELIEF") + nAdjustment);
    int nBelief = GetLocalInt(oJuror,"M_JUROR_BELIEF");
    // * player juror's behavior
    // * TEMP: for now just speaking the belief
    //AssignCommand(oJuror, SpeakString("Belief: " + IntToString(nBelief)));
    object oTorch = GetItemPossessedBy(oJuror, "NW_IT_TORCH001");
    object oSword = GetItemPossessedBy(oJuror, "NW_WSWLS001");
    // * hostile
    if (nBelief <= -2)
    {
        AssignCommand(oJuror,ActionEquipItem(oSword, INVENTORY_SLOT_RIGHTHAND));
        AssignCommand(oJuror,ActionUnequipItem(oTorch));

    }
    else
    // * positive
    if (nBelief >= 3)
    {
        AssignCommand(oJuror,ActionUnequipItem(oSword));
        AssignCommand(oJuror,ActionEquipItem(oTorch, INVENTORY_SLOT_LEFTHAND));

    }
    // * neutral
    else
    {
        AssignCommand(oJuror,ActionUnequipItem(oSword));
        AssignCommand(oJuror,ActionUnequipItem(oTorch));
    }

}

// *
// * array functions
// *


//::///////////////////////////////////////////////
//:: GetLocalArrayInt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns an integer, from nVarNum in the array
*/
//:://////////////////////////////////////////////
//:: Created By: Noel
//:: Created On:
//:://////////////////////////////////////////////

    int GetLocalArrayInt(object oidObject, string sVarName, int nVarNum)
    {
        string sFullVarName = sVarName + IntToString(nVarNum) ;
        return GetLocalInt(oidObject, sFullVarName);
    }

//::///////////////////////////////////////////////
//:: SetLocalArrayInt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the integer at nVarNum position
*/
//:://////////////////////////////////////////////
//:: Created By: Noel
//:: Created On:
//:://////////////////////////////////////////////

    void SetLocalArrayInt(object oidObject, string sVarName, int nVarNum, int nValue)
    {
        string sFullVarName = sVarName + IntToString(nVarNum) ;
        SetLocalInt(oidObject, sFullVarName, nValue);
    }

