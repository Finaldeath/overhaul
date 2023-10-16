//void main(){}
// This code is by Magic
int TalentIdentifyItem(object oItem)
{
  if(GetIdentified(oItem) == TRUE)
  {
   return TRUE;
  }
    SetIdentified(oItem,TRUE);

    int nLore = GetSkillRank(SKILL_LORE)+GetLevelByClass(CLASS_TYPE_BARD);

    int nValue = GetGoldPieceValue(oItem);
    if (nLore>=1 && nValue<=10 || nLore>=2 && nValue<=50
      || nLore>=3 && nValue<=100 || nLore>=4 && nValue<=150
      || nLore>=5 && nValue<=200 || nLore>=6 && nValue<=300
      || nLore>=7 && nValue<=400 || nLore>=8 && nValue<=500
      || nLore>=9 && nValue<=1000 || nLore>=10 && nValue<=2500
      || nLore>=11 && nValue<=3750 || nLore>=12 && nValue<=4800
      || nLore>=13 && nValue<=6500 || nLore>=14 && nValue<=9500
      || nLore>=15 && nValue<=13000 || nLore>=16 && nValue<=17000
      || nLore>=17 && nValue<=20000 || nLore>=18 && nValue<=30000
      || nLore>=19 && nValue<=40000 || nLore>=20 && nValue<=50000
      || nLore>=21 && nValue<=60000 || nLore>=22 && nValue<=80000
      || nLore>=23 && nValue<=100000 || nLore>=24 && nValue<=150000
      || nLore>=25 && nValue<=200000 || nLore>=26 && nValue<=250000
      || nLore>=27 && nValue<=300000 || nLore>=28 && nValue<=350000
      || nLore>=29 && nValue<=400000 || nLore>=30 && nValue<=500000
      || nLore>=31 && nValue<=100000*nLore-2500000) {
        return TRUE;
    }
    SetIdentified(oItem,FALSE);
    return FALSE;
}
