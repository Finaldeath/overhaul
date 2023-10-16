// kel-garas should teleport away if player has managed to lure him up to here.

void main()
{
    object oEnter = GetEnteringObject();
    if(GetTag(oEnter) == "Q2_KELGARAS")
        SignalEvent(oEnter, EventUserDefined(110));
}
