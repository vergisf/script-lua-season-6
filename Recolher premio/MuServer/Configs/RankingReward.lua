RankingReward_Config = {
    switch = true,
    Package = 12,
    commandClear = '/clearevent',

    commandsAdd = {
        --/comando NOME_PLAYER POSICAO (ex: /addranking1 Admin 1)
        [1] = '/addranking1',
        [2] = '/addranking2',
        [3] = '/addranking3',
        [4] = '/addranking4',
        [5] = '/addranking5',
        [6] = '/addranking6',
    },

    OAUTH = {
        --/comando NOME_PLAYER POSICAO (ex: /addranking1 Admin 1)
        ['admin'] = true,
        ['SIGREV'] = true,
    },

    TableConfigs = {
        table = 'RankingReward',
        whereName = 'name',
        whereLogin = 'memb___id',
        rankingNumber = 'rankingNumber',
	    rankingPosition = 'rankingPosition',
	    withdrawn = 'withdrawn',
    },

    TextsRankings = {
        ['Por'] = {
            [1] = 'Reset',
            [2] = 'MReset',
            [3] = 'Mata-Mata',
            [4] = 'Trade Wins',
            [5] = 'Blood Castle',
            [6] = 'Invasão'
        },

        ['Spn'] = {
            [1] = 'Reset',
            [2] = 'MReset',
            [3] = 'Mata-Mata',
            [4] = 'Trade Wins',
            [5] = 'Blood Castle',
            [6] = 'Invasão'
        },

        ['Eng'] = {
            [1] = 'Reset',
            [2] = 'MReset',
            [3] = 'Mata-Mata',
            [4] = 'Trade Wins',
            [5] = 'Blood Castle',
            [6] = 'Invasão'
        }
    },

    ConfigRanking = {
        [1] = { --Ranking Reset
            AmountRanking = 3,
            Reward = {
                [1] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 30
                },
                [2] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 20
                },
                [3] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 10
                }
            }
        },

        [2] = { --Ranking MReset
            AmountRanking = 3,
            Reward = {
                [1] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 30
                },
                [2] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 20
                },
                [3] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 10
                }
            }
        },

        [3] = { --Ranking Mata-Mata
            AmountRanking = 3,
            Reward = {
               [1] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 30
               },
               [2] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 20
               },
               [3] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 10
               }
            }
        },

        [4] = { --Ranking Trade Wins
            AmountRanking = 3,
            Reward = {
               [1] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 30
               },
               [2] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 20
               },
               [3] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 10
               }
            }
        },

        [5] = { --Ranking Blood Castle
            AmountRanking = 3,
            Reward = {
               [1] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 30
               },
               [2] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 20
               },
               [3] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 10
               }
            }
        },

        [6] = { --Ranking Invasão
            AmountRanking = 5,
            Reward = {
                [1] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 50
                },
                [2] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 40
                },
                [3] = {
                   item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                   amount = 30
                },
                [4] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 20
                },
                [5] = {
                    item = {Section = 14, index = 14, nome = 'Box Of Qualquer Coisa', daysExpire = 30},
                    amount = 10
                }
            }
        }
    },
}

return RankingReward_Config