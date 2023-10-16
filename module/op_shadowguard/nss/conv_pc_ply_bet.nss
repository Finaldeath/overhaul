void main()
{
    object oPC = GetPCSpeaker();

    AssignCommand(OBJECT_SELF, TakeGoldFromCreature(5, oPC, TRUE));

    int nNumbPlayers = GetLocalInt(OBJECT_SELF, "N_NUMB_OF_CARD_PLAYERS");

    int nBet = GetLocalInt(OBJECT_SELF, "N_BET_AMOUNT");

    int i;

    for (i = 0; i < nNumbPlayers; i++)
        nBet += 5;

    SetLocalInt(OBJECT_SELF, "N_BET_AMOUNT", nBet);
}
