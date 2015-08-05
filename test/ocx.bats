#!/usr/bin/env bats

@test "Python 2.7.X should be installed" {
    V=$(python --version 2>&1)
    [[ $V == Python\ 2.7* ]]
}

@test "fastq-dump v2.5.2" {
    F=$(fastq-dump --version)
    [[ $F == *2.5.2* ]]
}

@test "One Codex CLI v0.0.10" {
    X=$(onecodex --version 2>&1)
    [[ $X == *0.0.10\ \(API\ v0\)* ]]
}

@test "Join paired ends script exists" {
    X=$(python /scripts/join_paired_ends.py --help)
    [[ $X == *Join\ two\ FASTQ\ paired\ end\ read\ files.* ]]
}