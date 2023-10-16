//  * Tells the yuanti prisoner to turn into a yuanti
void main()
{
    if (GetTag(GetEnteringObject()) == "M3Q04G13YUAN" )
    {   SetLocalInt(GetModule(),"NW_G_M3Q04PLOTYUANTI",2) ;
        SignalEvent(GetEnteringObject(), EventUserDefined(2050));
    }
}
