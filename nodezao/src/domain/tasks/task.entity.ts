import { Column, Entity } from 'typeorm';
import AbstractEntity from '../core/abstract.entity';

@Entity('tasks')
export class Task extends AbstractEntity {
    @Column()
    name: string;
}
