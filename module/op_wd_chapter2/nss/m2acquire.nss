//::///////////////////////////////////////////////
//:: Chapter 2 Module Script: OnItemAcquiredBy
//:: m2Acquire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    1.  Unknown.
    2.  Unknown.
    3.  Unknown.
    4.  Unknown.
    5.  Unknown.
    6.  Unknown.
    7.  Unknown.
    8.  M2Q3: If the item is Silverback's Head,
        update appropriate journal entry.
    9.  M2Q3: If the item is Erik's Ma's Brooch,
        update appropriate journal entry.
    10. M2Q3: If the item is the Castle Jhareg
        Riddle Key, update appropriate journal
        entry.
    11. M2Q3: If the item is the Quint's Journal
        update appropriate journal entry.
    12. M2Q3: If the item is the Quint's Oath
        update differently depending on whether
        or not they've read Quint's Journal.
    13. M2Q3: If the item is the Karlat's Journal
        update appropriate journal entry.
    14. M2Q3: If the item is the Karlat's Oath
        update differently depending on whether
        or not they've read Karlat's Journal.
    15. M2Q1: If the item is Delilah's Ear and
        and Delilah's Ear has not already been
        previously acquired, increment the Bounty
        Hunter journal accordingly.
    16. M2Q1: If the item is Stirge's Ear and
        and Stirge's Ear has not already been
        previously acquired, increment the Bounty
        Hunter journal accordingly.
    17. M2Q1: If the item is Wyvern's Ear and
        and Wyvern's Ear has not already been
        previously acquired, increment the Bounty
        Hunter journal accordingly.
    18. M2Q1: If the item is Zor's Ear and Zor's
        Ear has not already been previously
        acquired, increment the Bounty Hunter
        journal accordingly.
    19. M2Q1: If the item is Setara's Gem and
        Setara's Gem has not already been
        previously acquired, increment the
        Serpent's Gems journal accordingly.
    20. M2Q1: If the item is Wanev's Gem and
        Wanev's Gem has not already been
        previously acquired, increment the
        Serpent's Gems journal accordingly.
    21. M2Q1: If the item is Zamithra's Gem and
        Zamithra's Gem has not already been
        previously acquired, increment the
        Serpent's Gems journal accordingly.
    22. M2Q1: If the item is Urth's Ring and
        Urth's Ring has not already been
        previously acquired, increment the
        Lycanthropy journal accordingly.
    23. M2Q1: If the item is Bran's Ring and
        Bran's Ring has not already been
        previously acquired, increment the
        Lycanthropy journal accordingly.
    24. M2Q1: If the item is Geth's Ring and
        Geth's Ring has not already been
        previously acquired, increment the
        Lycanthropy journal accordingly.
    25. M2Q1: If the item is the Journal of
        Sir Karathis, update the Lycanthropy
        journal accordingly.
    26. M2Q1: If the item is Alhelor's Tooth,
        update the Lycanthropy journal
        accordingly.
    27. M2Q1: If the item is Gulgash's Heart,
        update the Wanev journal accordingly.
    28. M2Q1: If the item is the Letter to
        Solomon, update the Solomon journal
        accordingly
    29. M2Q1: If the item is the Letter to Neva,
        update the Poor Neva journal accordingly
    30. M2Q1: If the item is the Letter to
        Vardoc, check to see if any of the other
        Cult Journals have been returned to
        Aribeth, then update the Vardoc journal
        accordingly.
    31. M2Q0: If the item is the Charwood Cultist's
        Journal, check to see if any of the other
        Cult Journals have been returned to Aribeth,
        then update the Charwood Cultist journal
        accordingly.
    32. M2Q0: If the item is Relmar's Journal
        check to see if any of the other Cult
        Journals have been returned to Aribeth,
        then update the Relmar journal
        accordingly. Also update the m2q2_Main
        journal.
    33. M2Q0: If the item is Ganon's Journal
        check to see if any of the Cult
        Journals have been returned to Aribeth,
        then update the Ganon journal accordingly
    34. M2Q0: If the item is the High Captain's
        Seal, update the Main journal accordingly
    35. M2Q5: If the item is Leah's Ring, update
        the Gerrol journal accordingly
    36. M2Q5: If the item is Dergiab's Head, update
        the Dergiab journal accordingly
    37. M2Q5: If the item is the Portal Tome,
        update the Arcane Mausoleum journal
        accordingly
    38. M2Q5: If the item is the Shadowdale
        Stone and the Shadowdale Stone has not
        already been previously acquired,
        increment the Arcane Mausoleum journal
        accordingly.
    39. M2Q5: If the item is the Dead City
        Stone and the Dead City Stone has not
        already been previously acquired,
        increment the Arcane Mausoleum journal
        accordingly.
    40. M2Q5: If the item is the Dark Wyrm
        Stone and the Dark Wyrm Stone has not
        already been previously acquired,
        increment the Arcane Mausoleum journal
        accordingly.
    41. M2Q2: If the item is Setara's Treatise,
        update the m2q2_Main journal accordingly.
    42. M2Q2: If the item is Spirit's Cure, update
        the m2q2_Main journal accordingly.
    43. M2Q2: If the item is the Troll Note, update
        the m2q2_Jax journal accordingly.
    44. M2Q2: If the item is the Complete History of the Creator Ruins,
        update the m2q2_Jax journal accordingly.
    45. M2Q2: If the item is the Troll Chieftain's,
        Head, update the m2q2_Lenton journal
        accordingly.
    46. M2Q2: If the item is the Mirror of Vanity,
        update the m2q2_Lenton journal accordingly.
    47. M2Q4: If the item is Yvette's Baby, check
        the journal state and update it if the
        quest is already active.
    48. M2Q4: If the item is Erb's Ring, check
        the journal state and update it if the
        quest is already active.
    49. M2Q4: If the item is the Ghoul's Amulet,
        check the journal state and update it if
        the quest is already active.
    50. M2Q1: If the item is the Imaskaran Tome of
        Death and the Imaskaran Tome of Death has
        not been previously acquired, update the
        m2q1_Imaskar journal accordingly.
    51. M2Q1: If the item is the Imaskaran Tome of
        Fire and the Imaskaran Tome of Fire has
        not been previously acquired, update the
        m2q1_Imaskar journal accordingly.
    52. M2Q1: If the item is the Imaskaran Tome of
        Ice and the Imaskaran Tome of Ice has
        not been previously acquired, update the
        m2q1_Imaskar journal accordingly.
    53. M2Q1: If the item is the Imaskaran Tome of
        Life and the Imaskaran Tome of Life has
        not been previously acquired, update the
        m2q1_Imaskar journal accordingly.
    54. M2Q1: If the item is the Imaskaran Tome of
        Resonance and the Imaskaran Tome of
        Resonance has not been previously
        acquired, update the m2q1_Imaskar journal
        accordingly.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: Jan 4, 2001
//:: Last Modified By: Rob Bartel
//:: Last Modified On: April 16, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oItem = GetModuleItemAcquired();
    object oPossessor = GetItemPossessor(oItem);
    string sItemTag = GetTag(oItem);

    if (GetIsPC(oPossessor))
    {
// 1. Unknown.
        if (GetTag(oItem) == "M2Q05IZOREAR" &&
            GetLocalInt(GetModule(),"NW_G_TookZorEar") == 0)
        {
            SetLocalInt(GetModule(),"NW_G_TookZorEar",10);
            RewardXP("m2q1_Bounty",15, GetPCSpeaker());
        }

// 2. Unknown.
        if (GetTag(oItem) == "M2Q03ISTIRGEEAR" &&
            GetLocalInt(GetModule(),"NW_G_TookStirgeEar") == 0)
        {
            SetLocalInt(GetModule(),"NW_G_TookStirgeEar",10);
            RewardXP("m2q1_Bounty",15, GetPCSpeaker());
        }

// 3. Unknown.
        if (GetTag(oItem) == "M2Q02IWYVERNEAR" &&
            GetLocalInt(GetModule(),"NW_G_TookWyvernEar") == 0)
        {
            SetLocalInt(GetModule(),"NW_G_TookWyvernEar",10);
            RewardXP("m2q1_Bounty",15, GetPCSpeaker());
        }


// 4. Unknown.
        if (GetTag(oItem) == "M2Q04IDELILAHEAR" &&
            GetLocalInt(GetModule(),"NW_G_TookDelilahEar") == 0)
        {
            SetLocalInt(GetModule(),"NW_G_TookDelilahEar",10);
            RewardXP("m2q1_Bounty",15, GetPCSpeaker());
        }


// 5. Unknown.
        if (GetTag(oItem) == "M2Q2ITJOURNCULT" &&
            GetLocalInt(GetModule(),"NW_G_DarktongueLeave") == 0)
        {
            SetLocalInt(GetModule(),"NW_G_DarktongueLeave",10);
        }

// 6. Unknown.
        if (GetTag(oItem) == "M2Q1ITKARJOURN")
        {
            if (GetLocalInt(oPossessor,"NW_L_M2Q1A02NEURIK_PLOT") < 45)
            {
                SetLocalInt(oPossessor,"NW_L_M2Q1A02NEURIK_PLOT",45);
            }
            if (GetLocalInt(GetModule(),"NW_G_ALHELOR_PLOT") < 30)
            {
                SetLocalInt(GetModule(),"NW_G_ALHELOR_PLOT",30);
            }
        }

// 7. Unknown.
        if (GetTag(oItem) == "M2Q5CULTJRNL")
        {
            if (GetLocalInt(oPossessor,"NW_L_ReadGannonJour") == 0)
            {
                SetLocalInt(oPossessor,"NW_L_ReadGannonJour",1);
            }
        }

// 8.  M2Q3: If the item is Silverback's Head,
//     update appropriate journal entry.
        if (sItemTag == "HEAD_m2q3E_Pete")
        {
            int iWolvesState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q3E_Wolves");
            if (iWolvesState > 0)
            {
                AddJournalQuestEntry("m2q3E_Wolves", 50, oPossessor);
            }
        }

// 9.  M2Q3: If the item is Erik's Ma's Brooch,
//     update appropriate journal entry.
        if (sItemTag == "M2Q3E_BROOCH")
        {
            int iBroochState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q3E_Brooch");
            if (iBroochState > 0)
            {
                AddJournalQuestEntry("m2q3E_Brooch", 30, oPossessor);
            }
            RewardXP("m2q3E_Brooch",50,GetPCSpeaker());
        }

// 10. M2Q3: If the item is the Castle Jhareg
//     Riddle Key, update appropriate journal
//     entry.
        if (sItemTag == "m2q3H_RiddleKey")
        {
            int iCharwoodState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q3E_Charwood");
            if (iCharwoodState > 0)
            {
                AddJournalQuestEntry("m2q3E_Charwood", 40, oPossessor);
            }
        }

// 11. M2Q3: If the item is the Quint's Journal
//     update appropriate journal entry.
        if (sItemTag == "M2Q3J_JOURNQuint")
        {
            int iQuintState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q3E_Quint");
            if (iQuintState > 0)
            {
                AddJournalQuestEntry("m2q3E_Quint", 20, oPossessor);
            }
        }

// 12. M2Q3: If the item is the Quint's Oath
//     update differently depending on whether
//     or not they've read Quint's Journal.
        if (sItemTag == "M2Q3_OATHQUINT")
        {
            int iQuintState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q3E_Quint");

            if (iQuintState == 10)
            {
                AddJournalQuestEntry("m2q3E_Quint", 30, oPossessor);
            }

            else if (iQuintState == 20)
            {
                AddJournalQuestEntry("m2q3E_Quint", 40, oPossessor);
            }
        }

// 13. M2Q3: If the item is Karlat's Journal
//     update appropriate journal entry.
        if (sItemTag == "m2q3I_JournKarlat")
        {
            int iKarlatState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q3E_Karlat");
            if (iKarlatState > 0)
            {
                AddJournalQuestEntry("m2q3E_Karlat", 20, oPossessor);
            }
        }

// 14. M2Q3: If the item is the Karlat's Oath
//     update differently depending on whether
//     or not they've read Karlat's Journal.
        if (sItemTag == "M2Q3_OATHKARLAT")
        {
            int iKarlatState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q3E_Karlat");

            if (iKarlatState == 10)
            {
                AddJournalQuestEntry("m2q3E_Karlat", 30, oPossessor);
            }

            else if (iKarlatState == 20)
            {
                AddJournalQuestEntry("m2q3E_Karlat", 40, oPossessor);
            }
        }

// 15. M2Q1: If the item is Delilah's Ear and
//     and Delilah's Ear has not already been
//     previously acquired, increment the Bounty
//     Hunter journal accordingly.
        if (sItemTag == "M2Q04IDELILAHEAR")
        {
            int iDelilah = GetLocalInt(GetModule(), "m2q1_DelilahEar");

            if (iDelilah == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_DelilahEar", TRUE);

                int iBountyState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Bounty");

                switch (iBountyState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 50, oPossessor);
                    }
                    break;
                }
            }
        }

// 16. M2Q1: If the item is Stirge's Ear and
//     and Stirge's Ear has not already been
//     previously acquired, increment the Bounty
//     Hunter journal accordingly.
        if (sItemTag == "M2Q03ISTIRGEEAR")
        {
            int iStirge = GetLocalInt(GetModule(), "m2q1_StirgeEar");

            if (iStirge == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_StirgeEar", TRUE);

                int iBountyState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Bounty");

                switch (iBountyState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 50, oPossessor);
                    }
                    break;
                }
            }
        }

// 17. M2Q1: If the item is Wyvern's Ear and
//     and Wyvern's Ear has not already been
//     previously acquired, increment the Bounty
//     Hunter journal accordingly.
        if (sItemTag == "M2Q02IWYVERNEAR")
        {
            int iWyvern = GetLocalInt(GetModule(), "m2q1_WyvernEar");

            if (iWyvern == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_WyvernEar", TRUE);

                int iBountyState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Bounty");

                switch (iBountyState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 50, oPossessor);
                    }
                    break;
                }
            }
        }

// 18. M2Q1: If the item is Zor's Ear and Zor's
//     Ear has not already been previously
//     acquired, increment the Bounty Hunter
//     journal accordingly.
        if (sItemTag == "M2Q05IZOREAR")
        {
            int iZor = GetLocalInt(GetModule(), "m2q1_ZorEar");

            if (iZor == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_ZorEar", TRUE);

                int iBountyState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Bounty");

                switch (iBountyState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Bounty", 50, oPossessor);
                    }
                    break;
                }
            }
        }

// 19. M2Q1: If the item is Setara's Gem and
//     Setara's Gem has not already been
//     previously acquired, increment the
//     Serpent's Gems journal accordingly.
        if (sItemTag == "M2Q1ITGEMSETARA")
        {
            int iSetara = GetLocalInt(GetModule(), "m2q1_SetaraGem");

            if (iSetara == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_SetaraGem", TRUE);

                int iGemState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Gems");

                RewardXP("m2q2_Mirror",50, GetPCSpeaker());

                switch (iGemState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Gems", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Gems", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Gems", 40, oPossessor);
                    }
                    break;
                }
            }
        }

// 20. M2Q1: If the item is Wanev's Gem and
//     Wanev's Gem has not already been
//     previously acquired, increment the
//     Serpent's Gems journal accordingly.
        if (sItemTag == "M2Q1ITGEMWANEV")
        {
            int iWanev = GetLocalInt(GetModule(), "m2q1_WanevGem");

            if (iWanev == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_WanevGem", TRUE);

                int iGemState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Gems");

                RewardXP("m2q1_Wanev",50, GetPCSpeaker());

                switch (iGemState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Gems", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Gems", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Gems", 40, oPossessor);
                    }
                    break;
                }
            }
        }

// 21. M2Q1: If the item is Zamithra's Gem and
//     Zamithra's Gem has not already been
//     previously acquired, increment the
//     Serpent's Gems journal accordingly.
        if (sItemTag == "M2Q1ITGEMSHART")
        {
            int iZamithra = GetLocalInt(GetModule(), "m2q1_ZamithraGem");

            if (iZamithra == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_ZamithraGem", TRUE);

                int iGemState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Gems");

                RewardXP("m2q1_Wanev",50, GetPCSpeaker());

                switch (iGemState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Gems", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Gems", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Gems", 40, oPossessor);
                    }
                    break;
                }
            }
        }

// 22. M2Q1: If the item is Urth's Ring and
//     Urth's Ring has not already been
//     previously acquired, increment the
//     Lycanthropy journal accordingly.
        if (sItemTag == "M2Q1ITRING01")
        {
            int iUrth = GetLocalInt(GetModule(), "m2q1_UrthRing");

            if (iUrth == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_UrthRing", TRUE);

                int iLycanthropyState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Lycanthropy");

                RewardXP("m2q1_Lycanthropy",10, GetPCSpeaker());

                switch (iLycanthropyState)
                {
                    case 10: case 20:
                    {
                        AddJournalQuestEntry("m2q1_Lycanthropy", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Lycanthropy", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Lycanthropy", 50, oPossessor);
                    }
                    break;
                }
            }
        }

// 23. M2Q1: If the item is Bran's Ring and
//     Bran's Ring has not already been
//     previously acquired, increment the
//     Lycanthropy journal accordingly.
        if (sItemTag == "M2Q1ITRING02")
        {
            int iBran = GetLocalInt(GetModule(), "m2q1_BranRing");

            if (iBran == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_BranRing", TRUE);

                int iLycanthropyState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Lycanthropy");

                RewardXP("m2q1_Lycanthropy",10, GetPCSpeaker());

                switch (iLycanthropyState)
                {
                    case 10: case 20:
                    {
                        AddJournalQuestEntry("m2q1_Lycanthropy", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Lycanthropy", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Lycanthropy", 50, oPossessor);
                    }
                    break;
                }
            }
        }

// 24. M2Q1: If the item is Geth's Ring and
//     Geth's Ring has not already been
//     previously acquired, increment the
//     Lycanthropy journal accordingly.
        if (sItemTag == "M2Q1ITRING03")
        {
            int iGeth = GetLocalInt(GetModule(), "m2q1_GethRing");

            if (iGeth == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_GethRing", TRUE);

                int iLycanthropyState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Lycanthropy");

                RewardXP("m2q1_Lycanthropy",10, GetPCSpeaker());

                switch (iLycanthropyState)
                {
                    case 10: case 20:
                    {
                        AddJournalQuestEntry("m2q1_Lycanthropy", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Lycanthropy", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Lycanthropy", 50, oPossessor);
                    }
                    break;
                }
            }
        }

// 25. M2Q1: If the item is the Journal of
//     Sir Karathis, update the appropriate
//     journal entry.
        if (sItemTag == "M2Q1ITKARJOURN")
        {
            int iLycanthropyState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Lycanthropy");
            if (iLycanthropyState > 0)
            {
                AddJournalQuestEntry("m2q1_Lycanthropy", 60, oPossessor);
            }
        }

// 26. M2Q1: If the item is Alhelor's Tooth,
//     update the appropriate journal entry.
        if (sItemTag == "M2Q1ITALHTOOTH")
        {
            int iLycanthropyState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Lycanthropy");
            if (iLycanthropyState > 0)
            {
                AddJournalQuestEntry("m2q1_Lycanthropy", 90, oPossessor);
            }
            RewardXP("m2q1_Lycanthropy",14, GetPCSpeaker());
        }

// 27. M2Q1: If the item is Gulgash's Heart,
//     update the appropriate journal entry.
        if (sItemTag == "M2Q3IGULGHEART")
        {
            int iWanevState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Wanev");
            if (iWanevState > 0)
            {
                AddJournalQuestEntry("m2q1_Wanev", 20, oPossessor);
            }
            RewardXP("m2q1_Wanev",50, GetPCSpeaker());
        }

// 28. M2Q1: If the item is the Letter to
//     Solomon, update the Solomon journal
//     accordingly
        if (sItemTag == "M2Q06ILETTSOLOMO")
        {
            int iSolomonState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Solomon");
            if (iSolomonState > 0)
            {
                AddJournalQuestEntry("m2q1_Solomon", 30, oPossessor);
            }
            RewardXP("m2q1_Solomon",100, GetPCSpeaker());
        }

// 29. M2Q1: If the item is the Letter to Neva,
//     update the Poor Neva journal accordingly
        if (sItemTag == "M2Q06ILETTNEVA")
        {
            int iNevaState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Neva");
            if (iNevaState > 0)
            {
                AddJournalQuestEntry("m2q1_Neva", 20, oPossessor);
            }
            RewardXP("m2q1_Neva",100, GetPCSpeaker());
        }

// 30. M2Q1: If the item is the Letter to
//     Vardoc, check to see if any of the other
//     Cult Journals have been returned to Aribeth,
//     then update the Vardoc journal accordingly.
        if (sItemTag == "M2Q1VARDLET")
        {
            int iCharwoodCultState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q0_CharwoodCult");
            int iRelmarState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q0_RelmarCult");
            //int iGanonState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q0_GanonCult");

            if (iCharwoodCultState < 10 && iRelmarState < 10)
            {
                AddJournalQuestEntry("m2q1_Vardoc", 40, oPossessor);
                RewardXP("m2q0_GanonCult",100, GetPCSpeaker());
            }
            else if (iCharwoodCultState == 10)
            {
                AddJournalQuestEntry("m2q0_CharwoodCult", 15, oPossessor);
                AddJournalQuestEntry("m2q1_Vardoc", 45, oPossessor);
                RewardXP("m2q0_GanonCult",100, GetPCSpeaker());
            }
            else if (iRelmarState == 10)
            {
                AddJournalQuestEntry("m2q0_RelmarCult", 15, oPossessor);
                AddJournalQuestEntry("m2q1_Vardoc", 45, oPossessor);
                RewardXP("m2q0_GanonCult",100, GetPCSpeaker());
            }
            else if (iCharwoodCultState == 15 && iRelmarState == 15)
            {
                AddJournalQuestEntry("m2q1_Vardoc", 45, oPossessor);
            }
            else
            {
                AddJournalQuestEntry("m2q1_Vardoc", 60, oPossessor);
            }
        }

// 31. M2Q0: If the item is the Charwood Cultist's
//     Journal, check to see if any of the other
//     Cult Journals have been returned to Aribeth,
//     then update the Charwood Cultist journal
//     accordingly.
        if (sItemTag == "M2Q3G_CULTJOURN")
        {
            int iVardocState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Vardoc");
            int iRelmarState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q0_RelmarCult");
            //int iGanonState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q0_GanonCult");

            // Destroy the cultists in the other areas if the journal was picked up.
            if (GetLocalInt(GetModule(),"NW_G_CultistJourFound") == 0)
            {
                SetLocalInt(GetModule(),"NW_G_CultistJourFound",1);
            }
            if (iVardocState < 40 && iRelmarState < 10)
            {
                AddJournalQuestEntry("m2q0_CharwoodCult", 10, oPossessor);
                RewardXP("m2q0_GanonCult",100, GetPCSpeaker());
            }
            else if (iVardocState == 40)
            {
                AddJournalQuestEntry("m2q0_CharwoodCult", 15, oPossessor);
                AddJournalQuestEntry("m2q1_Vardoc", 45, oPossessor);
                RewardXP("m2q0_GanonCult",100, GetPCSpeaker());
            }
            else if (iRelmarState == 10)
            {
                AddJournalQuestEntry("m2q0_CharwoodCult", 15, oPossessor);
                AddJournalQuestEntry("m2q0_RelmarCult", 15, oPossessor);
                RewardXP("m2q0_GanonCult",100, GetPCSpeaker());
            }
            else if (iVardocState == 45 && iRelmarState == 15)
            {
                AddJournalQuestEntry("m2q0_CharwoodCult", 15, oPossessor);
            }
            else
            {
                AddJournalQuestEntry("m2q0_CharwoodCult", 30, oPossessor);
            }
}

// 32. M2Q0: If the item is Relmar's Journal
//     check to see if any of the other Cult
//     Journals have been returned to Aribeth,
//     then update the Relmar journal
//     accordingly.  Also update the m2q2_Main
//     journal.
        if (sItemTag == "M2Q2GJRNRELMAR")
        {
            int iVardocState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Vardoc");
            int iCharwoodCultState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q0_CharwoodCult");
            //int iGanonState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q0_GanonCult");

            if (iVardocState < 40 && iCharwoodCultState < 10)
            {
                AddJournalQuestEntry("m2q0_RelmarCult", 10, oPossessor);
                RewardXP("m2q0_Ganon",100, GetPCSpeaker());
            }
            else if (iVardocState == 40)
            {
                AddJournalQuestEntry("m2q0_RelmarCult", 15, oPossessor);
                AddJournalQuestEntry("m2q1_Vardoc", 45, oPossessor);
                RewardXP("m2q0_GanonCult",100, GetPCSpeaker());
            }
            else if (iCharwoodCultState == 10)
            {
                AddJournalQuestEntry("m2q0_CharwoodCult", 15, oPossessor);
                AddJournalQuestEntry("m2q0_RelmarCult", 15, oPossessor);
                RewardXP("m2q0_GanonCult",100, GetPCSpeaker());
            }
            else if (iVardocState == 45 && iCharwoodCultState == 15)
            {
                AddJournalQuestEntry("m2q0_RelmarCult", 15, oPossessor);
            }
            else
            {
                AddJournalQuestEntry("m2q0_RelmarCult", 30, oPossessor);
            }

            AddJournalQuestEntry("m2q2_Main", 60, oPossessor);
        }

// 33. M2Q0: If the item is Ganon's Journal
//     check to see if any of the other Cult
//     Journals have been returned to Aribeth,
//     then update the Ganon journal accordingly.
        if (sItemTag == "M2Q5CULTJRNL")
        {
            int iVardocState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Vardoc");
            int iRelmarState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q0_RelmarCult");
            int iCharwoodCultState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q0_CharwoodCult");

            if (iVardocState < 50 || iRelmarState < 20 || iCharwoodCultState < 20)
            {
                AddJournalQuestEntry("m2q0_GanonCult", 10, oPossessor);
                RewardXP("m2q0_GanonCult",100, GetPCSpeaker());
            }

            else
            {
                AddJournalQuestEntry("m2q0_GanonCult", 30, oPossessor);
            }
        }

// 34. M2Q0: If the item is the High Captain's
//     Seal, update the Main journal accordingly
        if (sItemTag == "M2Q6A0SEAL")
        {
            AddJournalQuestEntry("m2q0_Main", 60, oPossessor);
            RewardXP("m2q0_Main",10, GetPCSpeaker());
        }

// 35. M2Q5: If the item is Leah's Ring, update
//     the Gerrol journal accordingly
        if (sItemTag == "M2Q05ILEAHRING")
        {
            int iGerrolState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q5_Gerrol");
            if (iGerrolState > 0)
            {
                AddJournalQuestEntry("m2q5_Gerrol", 40, oPossessor);
            }
        }

// 36. M2Q5: If the item is Dergiab's Head, update
//     the Dergiab journal accordingly
        if (sItemTag == "M2Q5DERGIABHEAD")
        {
            int iGerrolState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q5_Dergiab");
            if (iGerrolState > 0)
            {
                AddJournalQuestEntry("m2q5_Dergiab", 20, oPossessor);
            }
        }

// 37. M2Q5: If the item is the Portal Tome,
//     update the Arcane Mausoleum journal
//     accordingly
/*        if (sItemTag == "M2Q05IPORTALJOUR")
        {
            int iArcaneState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q5_Arcane");
            if (iArcaneState > 0)
            {
                AddJournalQuestEntry("m2q5_Arcane", 20, oPossessor);
            }
            RewardXP("m2q5_Arcane",100,GetPCSpeaker());
        }
*/
// 38. M2Q5: If the item is the Shadowdale
//     Stone and the Shadowdale Stone has not
//     already been previously acquired,
//     increment the Arcane Mausoleum journal
//     accordingly.
/*        if (sItemTag == "M2Q05IPSTONE01")
        {
            int iShadowdaleStone = GetLocalInt(GetModule(), "m2q5_ShadowdaleStone");

            if (iShadowdaleStone == FALSE)
            {
                SetLocalInt(GetModule(), "m2q5_ShadowdaleStone", TRUE);
                RewardXP("m2q5_Arcane",100,GetPCSpeaker());

                int iArcaneState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q5_Arcane");

                switch (iArcaneState)
                {
                    case 10:
                    case 20:
                    {
                        AddJournalQuestEntry("m2q5_Arcane", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q5_Arcane", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q5_Arcane", 50, oPossessor);
                    }
                    break;
                }
            }
        }
*/
// 39. M2Q5: If the item is the Dead City
//     Stone and the Dead City Stone has not
//     already been previously acquired,
//     increment the Arcane Mausoleum journal
//     accordingly.
/*        if (sItemTag == "M2Q05IPSTONE02")
        {
            int iDeadCityStone = GetLocalInt(GetModule(), "m2q5_DeadCityStone");

            if (iDeadCityStone == FALSE)
            {
                SetLocalInt(GetModule(), "m2q5_DeadCityStone", TRUE);
                RewardXP("m2q5_Arcane",100,GetPCSpeaker());

                int iArcaneState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q5_Arcane");

                switch (iArcaneState)
                {
                    case 10:
                    case 20:
                    {
                        AddJournalQuestEntry("m2q5_Arcane", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q5_Arcane", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q5_Arcane", 50, oPossessor);
                    }
                    break;
                }
            }
        }
*/
// 40. M2Q5: If the item is the Dark Wyrm
//     Stone and the Dark Wyrm Stone has not
//     already been previously acquired,
//     increment the Arcane Mausoleum journal
//     accordingly.
/*        if (sItemTag == "M2Q05IPSTONE03")
        {
            int iDarkWyrmStone = GetLocalInt(GetModule(), "m2q5_DarkWyrmStone");

            if (iDarkWyrmStone == FALSE)
            {
                SetLocalInt(GetModule(), "m2q5_DarkWyrmStone", TRUE);
                RewardXP("m2q5_Arcane",100,GetPCSpeaker());

                int iArcaneState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q5_Arcane");

                switch (iArcaneState)
                {
                    case 10:
                    case 20:
                    {
                        AddJournalQuestEntry("m2q5_Arcane", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q5_Arcane", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q5_Arcane", 50, oPossessor);
                    }
                    break;
                }
            }
        }
*/
// 41. M2Q2: If the item is Setara's Treatise, update
//     the m2q2_Main journal accordingly.
        if (sItemTag == "M2Q2ITTREATSPIRI")
        {
            int iQ2MainState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q2_Main");
            if (iQ2MainState > 0)
            {
                AddJournalQuestEntry("m2q2_Main", 40, oPossessor);
            }
        }

// 42. M2Q2: If the item is Spirit's Cure, update
//     the m2q2_Main journal accordingly.
        if (sItemTag == "M2Q2G_ANTIDOTE")
        {
            int iQ2MainState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q2_Main");
            if (iQ2MainState > 0)
            {
                AddJournalQuestEntry("m2q2_Main", 70, oPossessor);
            }
        }

// 43. M2Q2: If the item is the Troll Note, update
//     the m2q2_Jax journal accordingly.
        if (sItemTag == "M2Q2ITNOTETROLL")
        {
            int iJaxState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q2_Jax");
            if (iJaxState > 0)
            {
                AddJournalQuestEntry("m2q2_Jax", 20, oPossessor);
            }
        }

// 44. M2Q2: If the item is the Complete History of the Creator Ruins,
//     update the m2q2_Jax journal accordingly.
        if (sItemTag == "M2Q2CCRBOOK")
        {
            int iJaxState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q2_Jax");
            if (iJaxState > 0)
            {
                AddJournalQuestEntry("m2q2_Jax", 40, oPossessor);
            }
            RewardXP("m2q2_Jax",25, GetPCSpeaker());
        }

// 45. M2Q2: If the item is the Troll Chieftain's,
//     Head, update the m2q2_Lenton journal
//     accordingly.
        if (sItemTag == "HEAD_M2Q2ALENT")
        {
            int iLentonState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q2_Lenton");
            if (iLentonState > 0)
            {
                AddJournalQuestEntry("m2q2_Lenton", 20, oPossessor);
            }
        }

// 46. M2Q2: If the item is the Mirror of Vanity,
//     update the m2q2_Mirror journal accordingly.
        if (sItemTag == "M2Q2ITMIRRORVAN")
        {
            int iMirrorState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q2_Mirror");
            if (iMirrorState > 0)
            {
                AddJournalQuestEntry("m2q2_Mirror", 20, oPossessor);
            }
        }

// 47. M2Q4: If the item is Yvette's Baby, check
//     the journal state and update it if the
//     quest is already active.
        if (sItemTag == "2q4_YvettesBaby")
        {
            int iYvetteState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q4_Yvette");
            if (iYvetteState > 0)
            {
                AddJournalQuestEntry("m2q4_Yvette", 20, oPossessor);
            }
        }

// 48. M2Q4: If the item is Erb's Ring, check
//     the journal state and update it if the
//     quest is already active.
        if (sItemTag == "2q4_ErbsRing")
        {
            int iErbState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q4_Erb");
            if (iErbState > 0)
            {
                AddJournalQuestEntry("m2q4_Erb", 20, oPossessor);
            }
        }

// 49. M2Q4: If the item is the Ghoul's Amulet,
//     check the journal state and update it if
//     the quest is already active.
        if (sItemTag == "2q4F_GhoulAmu")
        {
            int iGhoulState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q4_Ghouls");
            if (iGhoulState > 0)
            {
                AddJournalQuestEntry("m2q4_Ghouls", 20, oPossessor);
            }
        }

// 50. M2Q1: If the item is the Imaskaran Tome of
//     Death and the Imaskaran Tome of Death has
//     not been previously acquired, update the
//     m2q1_Imaskar journal accordingly.

        if (sItemTag == "M2Q01TIMASKDEATH")
        {
            int iTomeDeath = GetLocalInt(GetModule(), "m2q1_TomeDeath");

            if (iTomeDeath == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_TomeDeath", TRUE);

                int iImaskarState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Imaskar");

                switch (iImaskarState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 50, oPossessor);
                    }
                    break;

                    case 50:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 55, oPossessor);
                    }
                    break;
                }
            }
        }

// 51. M2Q1: If the item is the Imaskaran Tome of
//     Fire and the Imaskaran Tome of Fire has
//     not been previously acquired, update the
//     m2q1_Imaskar journal accordingly.

        if (sItemTag == "M2Q01TIMASKFIRE")
        {
            int iTomeFire = GetLocalInt(GetModule(), "m2q1_TomeFire");

            if (iTomeFire == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_TomeFire", TRUE);

                int iImaskarState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Imaskar");

                switch (iImaskarState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 50, oPossessor);
                    }
                    break;

                    case 50:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 55, oPossessor);
                    }
                    break;
                }
            }
        }

// 52. M2Q1: If the item is the Imaskaran Tome of
//     Ice and the Imaskaran Tome of Ice has
//     not been previously acquired, update the
//     m2q1_Imaskar journal accordingly.

        if (sItemTag == "M2Q01TIMASKICE")
        {
            int iTomeIce = GetLocalInt(GetModule(), "m2q1_TomeIce");

            if (iTomeIce == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_TomeIce", TRUE);

                int iImaskarState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Imaskar");

                switch (iImaskarState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 50, oPossessor);
                    }
                    break;

                    case 50:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 55, oPossessor);
                    }
                    break;
                }
            }
        }

// 53. M2Q1: If the item is the Imaskaran Tome of
//     Life and the Imaskaran Tome of Life has
//     not been previously acquired, update the
//     m2q1_Imaskar journal accordingly.

        if (sItemTag == "M2Q01TIMASKLIFE")
        {
            int iTomeLife = GetLocalInt(GetModule(), "m2q1_TomeLife");

            if (iTomeLife == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_TomeLife", TRUE);

                int iImaskarState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Imaskar");

                switch (iImaskarState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 50, oPossessor);
                    }
                    break;

                    case 50:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 55, oPossessor);
                    }
                    break;
                }
            }
        }

// 54. M2Q1: If the item is the Imaskaran Tome of
//     Resonance and the Imaskaran Tome of
//     Resonance has not been previously
//     acquired, update the m2q1_Imaskar journal
//     accordingly.

        if (sItemTag == "M2Q01TIMASKRESON")
        {
            int iTomeReson = GetLocalInt(GetModule(), "m2q1_TomeReson");

            if (iTomeReson == FALSE)
            {
                SetLocalInt(GetModule(), "m2q1_TomeReson", TRUE);

                int iImaskarState = GetLocalInt(oPossessor, "NW_JOURNAL_ENTRYm2q1_Imaskar");

                switch (iImaskarState)
                {
                    case 10:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 20, oPossessor);
                    }
                    break;

                    case 20:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 30, oPossessor);
                    }
                    break;

                    case 30:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 40, oPossessor);
                    }
                    break;

                    case 40:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 50, oPossessor);
                    }
                    break;

                    case 50:
                    {
                        AddJournalQuestEntry("m2q1_Imaskar", 55, oPossessor);
                    }
                    break;
                }
            }
        }

    }
}
