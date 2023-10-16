//* If Gem is removed, destroy gem that Setara has
void main()
{
if(GetInventoryDisturbItem() == GetObjectByTag("M2Q1ITGEMSETARA"))
    {
        SignalEvent(GetObjectByTag("M2Q1CSETARA"),EventUserDefined(200));
    }
}
